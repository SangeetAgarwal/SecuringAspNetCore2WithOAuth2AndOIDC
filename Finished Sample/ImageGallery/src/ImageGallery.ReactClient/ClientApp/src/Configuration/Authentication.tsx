import {
  User,
  UserManagerSettings,
  WebStorageStateStore,
  Log,
  UserManager
} from "oidc-client";
import { History } from "history";

const client_id = process.env.REACT_APP_OPENID_CLIENTID;
const authority = process.env.REACT_APP_OPENID_AUTHORITY;
const redirect_uri = process.env.REACT_APP_OPENID_CALLBACKURL;
const silent_redirect_uri = process.env.REACT_APP_OPENID_SILENTRENEWURL;
const post_logout_redirect_uri = process.env.REACT_APP_OPENID_POSTLOGOUTURL;

export default class Authentication {
  userManager: UserManager;
  user: User | null;
  history: History<any>;
  constructor(history: History) {
    this.history = history;
    this.user = null;
    Log.logger = console;
    const config: UserManagerSettings = {
      authority,
      client_id,
      loadUserInfo: true,
      scope: "openid profile imagegalleryapi",
      response_type: "token id_token",
      post_logout_redirect_uri,
      userStore: new WebStorageStateStore({ store: window.localStorage }),
      automaticSilentRenew: true,
      silent_redirect_uri,
      redirect_uri
    };
    this.userManager = new UserManager(config);
    console.log(config);

    this.userManager.events.addUserLoaded(user => {
      this.user = user;
      console.log(user.profile);
    });
  }

  getUser = (cb: (user: User) => void): void => {
    if (this.user != null) cb(this.user);
    this.userManager.getUser().then(user => {
      this.user = user;
      cb(this.user);
    });
  };

  login = () => {
    console.log("current location", this.history.location);
    this.userManager.signinRedirect({ state: this.history.location });
  };

  logout = () => {
    this.userManager.signoutRedirect();
  };

  signInRedirectCallback = () => {
    this.userManager.signinRedirectCallback().then(
      user => {
        this.history.push(user.state.pathname);
      },
      error => {
        console.log(error);
      }
    );
  };

  isAuthenticated = (): boolean => {
    return (
      this.user != null && this.user.access_token != null && !this.user.expired
    );
  };
}

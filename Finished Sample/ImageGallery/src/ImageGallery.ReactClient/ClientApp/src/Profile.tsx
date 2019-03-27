import * as React from "react";
import Authentication from "./Configuration/Authentication";

export interface IState {
  profile: any;
}
export interface IComponentProps {
  authentication: Authentication;
}

export default class IApp extends React.Component<IComponentProps, IState> {
  state: IState = {
    profile: null
  };

  componentDidMount() {
    this.loadUserProfile();
  }

  loadUserProfile() {
    this.props.authentication.getUser(user => {
      this.setState({ profile: user && user.profile });
    });
  }
  public render() {
    const { profile } = this.state;
    if (!profile) return null;
    return (
      <>
        <h1>Profile</h1>
        <pre>{JSON.stringify(profile, null, 2)}</pre>
      </>
    );
  }
}

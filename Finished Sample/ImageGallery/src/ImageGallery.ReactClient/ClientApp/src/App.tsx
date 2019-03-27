import * as React from "react";
import MenuAppBar from "./MenuAppBar";
import { Route } from "react-router-dom";
import OrderFramedPicture from "./OrderFramedPicture";
import AddImage from "./AddImage";
import Authentication from "./Configuration/Authentication";
import { RouterProps, RouteComponentProps } from "react-router";
import Callback from "./Callback";
import Home from "./Home";
import Profile from "./Profile";

export interface IComponentProps {
  authentication: Authentication;
}

class App extends React.Component<RouteComponentProps<{}>, IComponentProps> {
  constructor(props: RouteComponentProps<{}>) {
    super(props);
    this.state = {
      authentication: new Authentication(this.props.history)
    };
  }

  render() {
    const { isAuthenticated } = this.state.authentication;
    return (
      <>
        <MenuAppBar authentication={this.state.authentication} />
        <Route
          path="/orderframedpicture"
          render={props => <OrderFramedPicture />}
        />
        <Route
          path="/addimage"
          render={props => (isAuthenticated() ? <AddImage /> : null)}
        />
        <Route
          path="/callback"
          render={props => (
            <Callback authentication={this.state.authentication} {...props} />
          )}
        />

        <Route
          path="/profile"
          render={props => (
            <Profile authentication={this.state.authentication} />
          )}
        />
        <Route path="/" exact component={Home} />
      </>
    );
  }
}

export default App;

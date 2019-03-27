import * as React from "react";
import Authentication from "./Configuration/Authentication";
import { RouterProps, RouteComponentProps } from "react-router";

export interface IComponentProps {
  authentication: Authentication;
}
export default class Callback extends React.Component<
  RouteComponentProps<{}> & IComponentProps
> {
  componentDidMount() {
    this.props.authentication.signInRedirectCallback();
  }

  public render() {
    return <div>loading...</div>;
  }
}

import React from "react";
import PropTypes from "prop-types";
import { createStyles, withStyles, WithStyles } from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import IconButton from "@material-ui/core/IconButton";
import MenuIcon from "@material-ui/icons/Menu";
import AccountCircle from "@material-ui/icons/AccountCircle";
import Switch from "@material-ui/core/Switch";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import FormGroup from "@material-ui/core/FormGroup";
import SwipeableDrawer from "@material-ui/core/SwipeableDrawer";
import List from "@material-ui/core/List";
import Divider from "@material-ui/core/Divider";
import ListItem from "@material-ui/core/ListItem";
import ListItemText from "@material-ui/core/ListItemText";
import { Link } from "react-router-dom";
import Authentication from "./Configuration/Authentication";

const styles = createStyles({
  root: {
    flexGrow: 1
  },
  grow: {
    flexGrow: 1
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20
  },
  list: {
    width: 250
  }
});

export interface IStyleProps extends WithStyles<typeof styles> {}

interface IComponentProps {
  authentication: Authentication;
}

export interface IState {
  left: boolean;
  top: boolean;
  isAuthenticated: boolean;
}

class MenuAppBar extends React.Component<
  IStyleProps & IComponentProps,
  IState
> {
  state: IState = {
    left: false,
    top: false,
    isAuthenticated: false
  };

  constructor(props: IStyleProps & IComponentProps) {
    super(props);
    this.props.authentication.getUser(user => {
      if (user != null && user.access_token != null && !user.expired) {
        this.setState({ isAuthenticated: true });
      }
    });
  }

  componentDidUpdate(
    previousProps: IStyleProps & IComponentProps,
    previousState: IState
  ) {
    if (!previousState.isAuthenticated) {
      this.props.authentication.getUser(user => {
        if (user != null && user.access_token != null && !user.expired) {
          this.setState({ isAuthenticated: true });
        }
      });
    }
  }

  handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    if (this.state.isAuthenticated) {
      this.props.authentication.logout();
    } else {
      this.props.authentication.login();
    }
  };

  toggleDrawer = (key: keyof IState, open: boolean) => () => {
    this.setState({ [key]: open } as any);
  };

  getProperty<T, K extends keyof T>(obj: T, key: K) {
    return obj[key];
  }

  setProperty<T, K extends keyof T>(obj: T, key: K, value: any) {
    obj[key] = value;
  }

  render() {
    const { classes, authentication } = this.props;
    const { isAuthenticated } = this.state;
    const sideList = (
      <div className={classes.list}>
        <List>
          <ListItem
            button
            key="AddImage"
            component={Link}
            {...{ to: "/addimage" } as any}
          >
            <ListItemText primary="Add an image" />
          </ListItem>
          <ListItem
            button
            key="OrderFramedPicture"
            component={Link}
            {...{ to: "/orderframedpicture" } as any}
          >
            <ListItemText primary="Order Framed Picture" />
          </ListItem>
        </List>
      </div>
    );

    return (
      <div className={classes.root}>
        {isAuthenticated && (
          <SwipeableDrawer
            open={this.state.left}
            onClose={this.toggleDrawer("left", false)}
            onOpen={this.toggleDrawer("left", true)}
          >
            <div
              tabIndex={0}
              role="button"
              onClick={this.toggleDrawer("left", false)}
              onKeyDown={this.toggleDrawer("left", false)}
            >
              {sideList}
            </div>
          </SwipeableDrawer>
        )}
        <FormGroup>
          <FormControlLabel
            control={
              <Switch
                checked={isAuthenticated}
                onChange={this.handleChange}
                aria-label="LoginSwitch"
              />
            }
            label={isAuthenticated ? "Logout" : "Login"}
          />
        </FormGroup>
        <AppBar position="static">
          <Toolbar>
            <IconButton
              className={classes.menuButton}
              color="inherit"
              aria-label="Menu"
              onClick={this.toggleDrawer("left", true)}
            >
              <MenuIcon />
            </IconButton>
            <Typography variant="h6" color="inherit" className={classes.grow}>
              Image Gallery
            </Typography>
            {authentication.isAuthenticated() && (
              <div>
                <IconButton
                  color="inherit"
                  component={Link}
                  {...{ to: "/profile" } as any}
                >
                  <AccountCircle />
                </IconButton>
              </div>
            )}
          </Toolbar>
        </AppBar>
      </div>
    );
  }
}

(MenuAppBar as React.ComponentClass<
  IStyleProps & IComponentProps
>).propTypes = {
  classes: PropTypes.object.isRequired
} as any;

export default withStyles(styles)(MenuAppBar);

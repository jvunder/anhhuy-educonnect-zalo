import React from 'react';
import { App, ZMPRouter, AnimationRoutes, SnackbarProvider } from 'zmp-ui';
import { RecoilRoot } from 'recoil';
import HomePage from 'pages/index';
import CoursesPage from 'pages/courses';
import ProfilePage from 'pages/profile';

// Modern gradient theme
const modernTheme = {
  primary: '#667eea',
  secondary: '#764ba2', 
  accent: '#f093fb',
  background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
  surface: '#ffffff',
  text: '#2d3748'
};

const MyApp = () => {
  return (
    <RecoilRoot>
      <App>
        <SnackbarProvider>
          <ZMPRouter>
            <AnimationRoutes>
              <Route path="/" component={HomePage} />
              <Route path="/courses" component={CoursesPage} />
              <Route path="/profile" component={ProfilePage} />
            </AnimationRoutes>
          </ZMPRouter>
        </SnackbarProvider>
      </App>
    </RecoilRoot>
  );
};

export default MyApp;

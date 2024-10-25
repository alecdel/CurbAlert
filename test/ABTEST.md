# A/B Testing

## A/B Test 1:  Page Navigation
User Story Number: US4 - Golden Path UI/UX

Metrics:
- Happiness: User ratings on app usability.
- Engagement: Time spent in the app, navigation actions per session.
- Adoption: Completion rate of key features accessed from the navigation menu.
- Task Success: Users are able to navigate the app succesfully.

Hypothesis: Including a bottom navigation bar instead of a side menu will make navigation simpler and more intuitive, leading to increased engagement and improved task success. 

This A/B Test will determine the most effective approach to in-app navigation and ease of access. The key question is whether placing core features in a visible bottom navigation bar will intuitively guide users through the app or if a hidden side menu, which conserves screen space, will provide a better experience.

Experiment: All users will be a part of this experiement; 50% of users will see and the bottom navigation bar, while the other 50% will see the side menu. As the variation being measured has a large impact on the user experience, it is important that we gather sufficient data across both variations to make the correct decision.

Firebase Remote Configuration will enable seamlessly toggling between variations, while Firebase A/B Testing will randomize users and automate metrics collection. Using Firebase Analytics, we will track key HEART metrics such as user engagement through navigation actions per session; happines through the net promoter score; and task success through the click through rate and number of items interacted with. 

Variations: There will be two variations for this test.

The first variation, or Variation A, will use a perpetually-visible bottom anchored navigation bar. The bar will include icons to navigate users between key pages (home, manage items, messaging, profile, etc.) This layout aims to provide quicker access to essential features, however, it removes text labels.

Variation A Example:

<img width="450" alt="Variation A" src="https://github.com/user-attachments/assets/ee9d62fb-aefa-43b8-9c56-41baaade9c7e">


The second variation, or Variation B, will use a hidden side menu, accessable through tapping a menu icon in the application. The design conserves screen space when not in use and provides additional clarity through text labels, but creates an additional step in the navigation process, possibly creating friction.

Variation B Example:

<img height="450" alt="Variation B" src="https://github.com/user-attachments/assets/4ba566e4-d376-494d-924c-356fe43873f0">


## Test 2

## Test 3

## Test 4

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


## A/B Test 2: Item Listing
User Story Number: US4 - Golden Path UI/UX

Metrics:
- Happiness: User ratings on app usability.
- Engagement: Time spent in the app, items viewed per session.
- Retention: Continued use of app item listing features over multiple weeks.
- Task Success: Users are able to successfully view details about an item.

Hypothesis: Including a grid view of items instead of a list view will allow users to view more items at once and force them to click on items for more details, increasing engagment and task success.

This A/B Test will measure the most positively recieved screen layout for one of the apps main features, item listings. The question is whether having a list view like many shopping apps will increase user engagement with the app, compared to having a more condensed grid view in which users must click on an item to view most of its details.

Experiment: All users will be a part of this experiment. 50% of users will see a list view of items, while the other 50% will see a grid view. This UI design may be an incredibly important factor in user engagement and experience so it is important to get the feedback from the entire user population.

Firebase Remote Configuration will enable seamlessly toggling between variations, while Firebase A/B Testing will randomize users and automate metrics collection. Using Firebase Analytics, we will track key HEART metrics such as user engagement through item viewing actions per session; happines through the net promoter score; and task success through the click through rate and number of items interacted with. 

Variations: There will be two variations for this test.

The first variation, or variation A, will use a list design for item viewing, including a small image, a short description of the item, and the distance it is from a users current location. This layout is designed to include more extensive information without a user needing to interact with the item posting.

Variation A Example: 

![image](https://github.com/user-attachments/assets/956cd248-4d25-4c3d-bbef-967c210ff823)

The second variation, or variation B, will use a grid design layout for item viewing. In this design, there will only be an image of the item and its distance from the users current location. All other information about the item will be on a separate page that is navigated to after a user clicks on an item in the list. This layout design is intended to increase user engagement with the item listing screen by giving users more reasons to view an items details.

Varation B Example:

![image](https://github.com/user-attachments/assets/574ec1cc-d780-4983-b16e-3c41d9bd212c)



## Test 3 Messaging Interface Design
User Story Number: US5 - User-to-User Messaging

Metrics:

Happiness: User satisfaction ratings on the messaging experience.
Engagement: Frequency and duration of messaging interactions per session.
Task Success: Successful completion of messaging tasks, such as initiating and replying to conversations.
Hypothesis: Switching to a streamlined, chat-style messaging interface will make conversations feel more fluid and engaging, leading to more frequent use and higher task success.

Problem and Impact: Users may feel disconnected or frustrated by a traditional messaging layout, where messages are grouped in inbox and outbox views, rather than a continuous chat format. This could impact task success and engagement, especially for users seeking real-time or ongoing conversations.

Experiment: All users with messaging permissions will be included. Firebase will assign 50% of users to see a chat-style interface (Variation A) and the other 50% to see the traditional inbox/outbox format (Variation B). Firebase Remote Config will enable switching between the two interfaces, while Firebase Analytics will monitor HEART metrics, particularly engagement (messages sent and received) and task success (messages successfully opened and replied to).

Variations:

Variation A (Chat-Style Interface): A continuous chat format, similar to popular messaging apps, showing all messages in one flowing conversation view. Users can see the latest messages at the bottom and send replies instantly, enhancing the sense of real-time communication.

Variation B (Inbox/Outbox Format): A more traditional messaging format with separate views for incoming and outgoing messages. Users have to navigate between inbox and outbox to see sent and received messages, which may help organization but could slow down interaction.

This test will help determine if a chat-style interface increases engagement and task success by making conversations feel more direct and real-time, compared to a segmented inbox/outbox setup.

## A/B Test 4: Sale Completion Process

**User Story Number**: US5 - Completing a Sale

**Metrics**:
- **Happiness**: User feedback ratings on ease of sale completion.
- **Task Success**: Rate of successful sale completions.
- **Conversion Rate**: Number of listings that lead to a completed sale.
- **Engagement**: Time taken to complete the sale process and number of steps involved.

**Hypothesis**: Streamlining the sale process by reducing the number of steps will improve the user experience, leading to higher completion rates and greater overall satisfaction.

**Problem and Impact**: A lengthy or complex sale completion process may discourage users from completing transactions, lowering conversion rates and user satisfaction. A simplified process could reduce friction and boost completion rates.

**Experiment**: All users participating in the sale process will be included in this test. 50% will experience a streamlined process (Variation A), while the other 50% will experience the standard process with more detailed prompts (Variation B). Firebase Remote Configuration will enable seamless toggling between variations, while Firebase A/B Testing will randomize users and collect metrics.

**Variations**:

- **Variation A (Streamlined Process)**: The sale completion page has a minimal set of fields, focusing only on essential actions—confirming the item pickup and marking the item as “sold.” This reduces steps and aims to provide a faster experience.

  **Variation A Example**:
  - Mark as "Sold" button
  - Quick rating system for both parties (optional)
  - Option to add a brief review or feedback (optional)

- **Variation B (Detailed Process)**: The sale completion page includes additional fields, such as verifying item details, confirming transaction type (if it was picked up or left on the curb), and allowing users to enter feedback. This design is intended to give users more control and detail, potentially increasing task success through clarity.

  **Variation B Example**:
  - Mark as "Sold" button
  - Optional fields for pickup location confirmation
  - Required review field for feedback on the transaction

This test will reveal whether users prefer a simpler process, resulting in a quicker sale, or if additional details improve the quality of the experience, leading to higher satisfaction and task success.


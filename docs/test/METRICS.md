# HEART Framework

[Link to HEART Framework](https://docs.google.com/presentation/d/18S2Rc6vmY-HL8rcVbEIPXLjRemgh_oYLE51DBTDtsIM/edit?usp=sharing)

## Metrics

### Happiness
- Net Promoter Score - The user will be prompted to answer the survey when opening the messages feature of the application.

### Engagement
- Firebase Analytics will be used to automatically track Daily Active Users (DAU) by logging each unique user session on a daily basis.
- We will configure Firebase Analytics to track user engagement across key activities (login, posting an item, browsing items).
- Additional custom events may be set up to measure daily engagement with features such as item views and successful transactions.

### Adoption
- Adoption rate will be gathered with Firebase analytics to see the rate at which new emails are signing up for the app.
- Custom events will be added to log when a user posts their first item.
- Custom events will be added to log how long it takes for a user to post their first item.

### Retention
- Retention rate will be gathered via Firebase analytics to see the overall rate for users returning to the app.
- Firebase will monitor user activity, such as logging back into the app, posting another item, or completing transactions over time.
- Custom retention events will be added to log repeat activity, and these will be timestamped to track return rates.

### Task Success
- The success rate from when a user starts creating an item listing to when the listing is actully published. To see if they finished to listing.

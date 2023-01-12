# Midterm Project

### Team
- Liz Baze - Database Administration
- Natasha Gough - GitHub Repo Owner
- Jay Trawick - Scrum Master

### Overview
Collaborative project that requires designing and building a database, project control through trello and wire frame, and the creation a fully functioning website hosted on EC2 that allows users to interact with the site and database.

For our project, we decided to build a database that contained information about native plants and users. Concerning plants, we generated data including their habitat, growth zone, light requirements, endangered status etc.  For users, we allowed them to add a plant to the database, add sightings of plants and comment on plants. Users are able to follow other users and see their recent activity including who that user follows and what they comment on. Users can also edit the plants they have added as well as edit sightings. They are also given the option to delete their account.

Overall, we created a project that met all of our personal baseline goals we set on day one and were able to complete a few stretch goals. There was more that we wanted to do but rather than keep reaching for stretch goals we decided to "try to break" what we had and build the product out through styling and functionality.


### Technologies Used
- MAMP
- SQL
- HTML
- Gradle
- Maven
- JPA/Hibernate
- JUnit Testing
- Bootstrap
- CSS
- MySQLWorkbench
- Trello
- WireFrame
- GitHub
- SpringToolSuite
- Terminal

| MAMP |
|   |   |   |   |   |
|---|---|---|---|---|
|   |   |   |   |   |
|   |   |   |   |   |
|   |   |   |   |   |

### Lessons Learned
- Database build out is more fine tuned than we expected. Initially we built a database that had the same information compressed into a small amount of tables. Upon database review we learned that expanding the database into sub-tables with correlated mapping allowed us to manipulate data to fit our needs.
- Creating controllers that are specific to each larger concept i.e. 'Plant', 'Sighting', 'User' made trouble shooting much easier.
- The letter 'S'!!!! We spent a lot of time reading stack trace errors only to learn that the error came down to the single letter and a lack of uniformity in our naming conventions. Due to the scope of the project and the amount of entities, controllers, DAOs etc it would have behooved up to think through naming conventions sooner so that we could have standardized code.

### How To Run/Use
You can access this program through the following link:
<- insert link ->

or

This program needs compiled to run it on local host or EC2. Download the repository to a local directory. Open Spring Tool Suite or your IDE of choice and import the project. After it is compiled click run and follow prompts.

A guest to the site can view plants, search through the plant database by key terms and view plant sightings/comments on plant sightings.

To interact with the site a user must register on the home page where they are then vectored to update their profile information. Once you are signed in they have the ability add a plant to the database. You can edit and delete the plant you input. Additionally you can add a sighitng of a plant as well as comment on other plant sightings. Lastly you can follow users.


### Future Goals
- Allowing users to interact based on similar zone locations, pair addresses with zones

- Integrate GoogleMaps API to allow interactive maps to display Lat/Long data of sightings

- Verification criteria to allow "status" as an editor of content on site

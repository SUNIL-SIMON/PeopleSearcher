# peoplesearcher

In this Flutter project :-

Features
- Indefinite scrolling : the list loads new data when the user reaches the end of the list.
- Details page : Open 1 element from the list to see further details.
- Avatar : Avatar Images are selectable from list as well as details page, that shows image in full screen image view.
- full screen image is zoomable.
- Search : search could be performed on the list page with ‘contains’ expression.

Architecture
- MVVM pattern using change notifiers.
- Dependency inversions used in places to allow mock and test portion writing.

User Exception feedback
- Loading indicators : loading is shown until the image is downloaded from the server, then image will be replaced when present/downloaded.
- Exception dialogue : all server exceptions, network exceptions, serialise exceptions will be shown to the user with appropriate message.

Developer Exception tracking
- Memory management tracking in list view, debugging prints will run along to determine how many list elements of view are getting initialised and disposed.

Testing
- Network mocking is done in ‘PeopleListMockRepository’ using Dependency inversion.
- Network exception testing is done using wrong list URL from URLMockConstants using Dependency inversion.
- Unit testing : Written ‘SearchPeople()’ unit testing.

Some extra things to note
- All images data downloaded will remain cached for reuse without having being to download same image multiple times, as and when the element moves away and back in during scrolling. Careful release or flushing of those images is also handled when the pool threshold is reached having the oldest image to be flushed from memory and newest will be inserted.
- Separate Appearance class is present to control the theme/color of the app centralised.


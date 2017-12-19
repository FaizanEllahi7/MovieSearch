# MovieSearch

## Purpose
MovieSearch is an app that search for movies and get the list of movies related to that searched text.


## Architecture

MovieSearch app use the MVVM architecture. The view controller is used for the UI related tasks and view model is used to fetch data from server and populate that data which is used by controllers to show the result.

## View Controllers

**MovieSearchViewController:** It contain a search bar to enter the text to search movies and a tableview to populate the data which is fetched from thr server. All the data comes from the view model and view controller does not know anything about the data popolation. MovieSearchViewController listen to the Dynamic property(searchResult) of viewmodel and listen fire when any change happen in the movies list model. SearchResult is an enum and update the table view in case of success and show a popup alert in case of failure with alert message.

**SearchResultsController:** It is used to show the history of last 10 successful quries in the tableview. ViewModel get the data from the persistent storage and this controller show that list to the user.

## ViewModel

**QueryResult:** View Model implemented the  QueryResult protocol which contain the a dynamic property of MovieSearchResult. When data updated in the model then view model update the value (either success or failure )of dynamic property and view controller listen to this property to update the UI accordingly.

**PersistentRepresentable:** ViewModel does not know about the persisitence data of the app. Any database that implemented the PersistentRepresentable protocol can assign to the viewModel storage property. This protocol contain only two methods, one to save data to the data base and second to get the list of last 10 successful queries. In this app CoreData Implelemted this protocol.

**MovieRepresentable:** This protocol is used to display the data from model to tableview cell. Tableview does not know about the viewModel or Movies model, this add a extra layer of security. MovieCellData implementd this protocol and if we have to assign default values to text or image in case of data is missing on server, we can assign it in the initialization method.


## Networking

**AlamofireNetworkRequest:**  Send the alamofire network request to server and fetch the response against the the url request

**NetworkRequestProtocol:** It used the AlamofireNetworkRequest protocol to fetch response and check the response. If response is successful then convert the response data into data model using the generic decodable protocol.

**RequestProtocol:** Creates a URLRequestConvertible using the specific request parameters like url, method, headers, parameters, encoding.

## PersistentStorage

**PersistentRepresentable:** ViewModel does need to know about the database. Our app can use any database like Core Data, SQLite, iCloud, FMDB. View model only need to save the successful query to database and fetch last 10 successful quries. So any data base implemented this protocol can assign to the viewModel and we can change the data base any time without any changes to viewModel.

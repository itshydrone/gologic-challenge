GoLogic Coding challenge
========================

Description
-----------

The solution provided in this repository offers a fully functional room booking website. It provides users the ability to view what rooms are available, see their respective details and make bookings for the dates that they would like. The back-end is built with PHP and the front-end is built with HTML, CSS and JS. It uses a MySQL database to store all room and booking information.

The project is intended to be full-stack, with slightly more emphasis on the back-end infrastructure.

Architecturally, the user interacts with the front-end, which uses the API to send or receive information from the back-end. This creates a clear divide between the front and back-end, ensuring that there is very little interdependence between the two and allows for changes to be made on each component independently with a low likelihood of impacting each other. 

Although the solution achieves its purpose of providing a fully functional booking system, there are things that could be improved or integrated if more time was spent working on it. One key aspect would be to expand the API to also allow it to be used to add new rooms or edit existing ones. This would be an important feature if this was going to enter production and be an actual booking service. However, if that was to be implemented, some level of API authentication would need to be added as well to ensure that only certain people can make changes to the rooms offering. In addition to that, another useful feature would be to provide some sort of image hosting solution, likely through a CDN. Currently, the system just accepts the URL of the image, but a better solution would be to accept the actual image and then host it directly on a CDN. This would reduce the likelihood of image links breaking and also provide improved scalability as well as fully control over the platform.

Hosted Website
------------

Installation
------------

API Documentation
-----------------

**getRooms**

Gets a list of rooms being offered to book.

* **URL**

  `/api/getrooms`

* **Method:**
  
  `GET`
  
*  **URL Params**

   **Optional:**
 
   `page=[integer]` - the page of rooms to retrieve

* **Example Request:**
  
  `/api/getrooms?page=1`

  * **Success Response:** `{"status":"success","result":[...],"hasNextPage":true}`
  * **Error Response:** `{"status":"error","message":"..."}`
# GoLogic Coding challenge

## Description

The solution provided in this repository offers a fully functional room booking website. It provides users with the ability to view what rooms are available, see their respective details and make bookings for the dates that they would like. The back-end is built with PHP and the front-end is built with HTML, CSS and JS. It uses a MySQL database to store all room and booking information.

The project is intended to be full-stack, with slightly more emphasis on the back-end infrastructure.

Architecturally, the user interacts with the front-end, which uses the API to send or receive information from the back-end. This creates a clear divide between the front and back-end, ensuring that there is very little interdependence between the two and allows for changes to be made on each component independently with a low likelihood of impacting each other. 

Although the solution achieves its purpose of providing a fully functional booking system, there are things that could be improved or integrated if more time was spent working on it. One key aspect would be to expand the API to also allow it to be used to add new rooms or edit existing ones. This would be an important feature if this was going to enter production and be an actual booking service. However, if that was to be implemented, some level of API authentication would need to be added as well to ensure that only certain people can make changes to the room offering. In addition to that, another useful feature would be to provide some sort of image hosting solution, likely through a CDN. Currently, the system just accepts the URL of the image, but a better solution would be to accept the actual image and then host it directly on a CDN. This would reduce the likelihood of image links breaking and also provide improved scalability as well as full control over the platform.

## Hosted Website

The live version of the website can be accessed at [roomboking.ga](https://roombooking.ga/)

## API Documentation

### **getRooms**

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

### **getRoom**

Gets the details of a specific room.

* **URL**

  `/api/getroom`

* **Method:**
  
  `GET`
  
*  **URL Params**

   **Required:**
 
   `roomid=[integer]` - the ID of the room to retrieve

* **Example Request:**
  
  `/api/getroom?roomid=3`

  * **Success Response:** `{"status":"success","result":{...}}`
  * **Error Response:** `{"status":"error","message":"..."}`

### **createBooking**

Creates a new booking for a room.

* **URL**

  `/api/createbooking`

* **Method:**
  
  `GET`
  
*  **URL Params**

   **Required:**
 
   `roomid=[integer]` - the ID of the room to book </br>
   `email=[string]` - email address to book for </br>
   `startdate=[string]` - the start date of the booking (yyyy-mm-dd) </br>
   `enddate=[string]` - the end date of the booking (yyyy-mm-dd) </br>
   `guestcount=[integer]` - number of guests that will be staying </br>

* **Example Request:**
  
  `/api/createbooking?roomid=3&email=my@gmail.com&startdate=2021-12-13&enddate=2021-12-16&guestcount=2`

  * **Success Response:** `{"status":"success","result":{...}}`
  * **Error Response:** `{"status":"error","message":"..."}`
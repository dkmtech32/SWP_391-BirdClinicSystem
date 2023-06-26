/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const datetimeSlotPicker = document.querySelector('datetime-slot-picker');
     
     /* LISTENER FOR DATE AND TIME SLOT CHANGES */
     datetimeSlotPicker.addEventListener('slotUpdate', function(event){ console.log('Updated Slot: ', event.detail) });
      
     /* INITIALIZING THE AVAILABLE SLOTS. TIME SLOTS IS OPTIONAL */
     datetimeSlotPicker.slots = [
       {
         "date": 'Thu, 26 Nov 2020',
         "timeSlots": [
           '6 AM - 7 AM',
           '7 AM - 8 AM',
           '8 AM - 9 AM',
           '9 AM - 10 AM',
           '10 AM - 11 AM',
           '11 AM - 12 PM',
           '12 PM - 1 PM',
           '1 PM - 2 PM',
           '2 PM - 3 PM',
           '3 PM - 4 PM',
           '4 PM - 5 PM',
           '5 PM - 6 PM',
           '6 PM - 7 PM',
           '7 PM - 8 PM',
           '8 PM - 9 PM',
           '9 PM - 10 PM',  
           '10 PM - 11 PM',
           '11 PM - 12 AM'     
          ]
       },
       {
         "date": 'Fri, 27 Nov 2020',
         "timeSlots": [
         ]
       },
       {
         "date": 'Mon, 30 Nov 2020',
         "timeSlots": [
           '10 AM - 11 AM',
           '11 AM - 12 PM',
           '4 PM - 5 PM',
           '5 PM - 6 PM'
         ]
       },
       {
         "date": 'Tue, 1 Dec 2020',
         "timeSlots": [
           '10 AM - 11 AM',
           '11 AM - 12 PM',
           '4 PM - 5 PM',
           '5 PM - 6 PM'
         ]
       },
       {
         date: 'Mon, 4 Jan 2021',
         timeSlots: [
           '6 AM - 7 AM',
           '7 AM - 8 AM',
           '8 AM - 9 AM',
           '1 PM - 2 PM',
           '2 PM - 3 PM',
           '4 PM - 5 PM',
           '5 PM - 6 PM',
           '6 PM - 7 PM',
           '7 PM - 8 PM',
           '8 PM - 9 PM'  
         ]
       }
     ];

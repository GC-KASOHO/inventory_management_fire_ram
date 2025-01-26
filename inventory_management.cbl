       IDENTIFICATION DIVISION.
       PROGRAM-ID. inventory_management.
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT RECEIPT-FILE ASSIGN TO "receipt.TXT"
           ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD RECEIPT-FILE.

       01 RECEIPT-RECORD.
           05 ITEM-ID PIC 9(5).
           05 ITEM-NAME PIC X(20).
           05 ITEM-PRICE PIC 9(5).
           05 ITEM-QUANTITY PIC 9(5).

       WORKING-STORAGE SECTION.
       01 I-ID PIC 9(5).
       01 I-NAME PIC X(20).
       01 I-PRICE PIC 9(5).
       01 I-QUANTITY PIC 9(5).
       01 USER-CHOICE PIC 9(5).
       01 OUTPUT-LINE PIC X(50).

       PROCEDURE DIVISION.
           PERFORM UNTIL USER-CHOICE = 3
           CALL "SYSTEM" USING "CLS"
           DISPLAY "||=======================================||"
           DISPLAY "||     Inventory Management System       ||"
           DISPLAY "||=======================================||"
           DISPLAY "||   1. Add Item                         ||"
           DISPLAY "||   2. Update Item                      ||"
           DISPLAY "||   3. View Inventory                   ||"
           DISPLAY "||   4. Search Item                      ||"
           DISPLAY "||   5. Delete Item                      ||"
           DISPLAY "||   6. Exit                             ||"
           DISPLAY "||=======================================||"
           DISPLAY "Enter your choice: " NO ADVANCING
           ACCEPT USER-CHOICE

           EVALUATE USER-CHOICE
           WHEN 1
               PERFORM ADD-ITEM
           WHEN 2
               PERFORM UPDATE-ITEM
           WHEN 3
               DISPLAY "Exit"
           END-EVALUATE
           END-PERFORM
           STOP RUN.

       ADD-ITEM.
           DISPLAY "Enter the item id: " NO ADVANCING
           ACCEPT I-ID

           DISPLAY "Enter the name of the product: " NO ADVANCING
           ACCEPT I-NAME

           DISPLAY "Enter the price of the product: " NO ADVANCING
           ACCEPT I-PRICE

           DISPLAY "Enter the quantity of the product: " NO ADVANCING
           ACCEPT I-QUANTITY

           MOVE I-ID TO ITEM-ID
           MOVE I-NAME TO ITEM-NAME
           MOVE I-PRICE TO ITEM-PRICE
           MOVE I-QUANTITY TO ITEM-QUANTITY

           OPEN OUTPUT RECEIPT-FILE
           WRITE RECEIPT-RECORD
           CLOSE RECEIPT-FILE
           OPEN OUTPUT RECEIPT-FILE
           STRING "ID: " ITEM-ID DELIMITED BY SIZE 
               INTO OUTPUT-LINE
           WRITE RECEIPT-RECORD FROM OUTPUT-LINE
           STRING "Name: " I-NAME DELIMITED BY SIZE 
           INTO OUTPUT-LINE    STRING "Name: " I-NAME DELIMITED BY SIZE 
               INTO OUTPUT-LINE
           WRITE RECEIPT-RECORD FROM OUTPUT-LINE
           STRING "Price: " I-PRICE DELIMITED BY SIZE 
               INTO OUTPUT-LINE
           WRITE RECEIPT-RECORD FROM OUTPUT-LINE
           STRING"Quantity: " I-QUANTITY DELIMITED BY SIZE 
               INTO OUTPUT-LINE
           WRITE RECEIPT-RECORD FROM OUTPUT-LINE
           CLOSE RECEIPT-FILE
           CLOSE RECEIPT-FILE
           DISPLAY "Item added successfully!".
       
       UPDATE-ITEM.
           DISPLAY "Enter the item ID to update: " NO ADVANCING
           ACCEPT I-ID
           
           OPEN OUTPUT RECEIPT-FILE
           MOVE I-ID TO ITEM-ID
           MOVE I-NAME TO ITEM-NAME
           MOVE I-PRICE TO ITEM-PRICE
           MOVE I-QUANTITY TO ITEM-QUANTITY
           
           DISPLAY "Enter new name: " NO ADVANCING
           ACCEPT I-NAME
           DISPLAY "Enter new price: " NO ADVANCING
           ACCEPT I-PRICE
           DISPLAY "Enter new quantity: " NO ADVANCING
           ACCEPT I-QUANTITY
           
           WRITE RECEIPT-RECORD
           STRING "ID: " ITEM-ID DELIMITED BY SIZE 
               INTO OUTPUT-LINE
           WRITE RECEIPT-RECORD FROM OUTPUT-LINE
           STRING "Name: " I-NAME DELIMITED BY SIZE 
               INTO OUTPUT-LINE
           WRITE RECEIPT-RECORD FROM OUTPUT-LINE
           STRING "Price: " I-PRICE DELIMITED BY SIZE 
               INTO OUTPUT-LINE
           WRITE RECEIPT-RECORD FROM OUTPUT-LINE
           STRING "Quantity: " I-QUANTITY DELIMITED BY SIZE 
               INTO OUTPUT-LINE
           WRITE RECEIPT-RECORD FROM OUTPUT-LINE
           
           CLOSE RECEIPT-FILE
           DISPLAY "Item updated successfully!".

          
#!/usr/bin/env python3

import random
import mysql.connector
import time

print("[NexaBank Admin Tool v1.2.7] Running student debt adjustment script...")

try:
    # Establish connection
    db = mysql.connector.connect(
        host="localhost",
        user="root",           
        password="",  
        database="nexabank_db"
    )

    cursor = db.cursor()
    
    # Get IDS
    cursor.execute("SELECT username, hidden_fees FROM student_debt")
    students = cursor.fetchall()

    print(f"[INFO] Found {len(students)} customer records... Applying adjustments.")
    time.sleep(1)

    for username, old_fee in students:
        added_fee = random.randint(0, 500)
        new_fee = old_fee + added_fee
        cursor.execute("UPDATE student_debts SET hidden_fees = %s WHERE username = %s", (new_fee, username))
        print(f" -> Student ID: {username} | +{added_fee} PHP hidden fees")

    db.commit()
    print("\n[✓] All records updated. System will reflect new balances shortly.")
    print("[NOTE] Do NOT run this script more than once per month as per protocol.")

except mysql.connector.Error as err:
    print(f"[ERROR] Database operation failed: {err}")
finally:
    if db.is_connected():
        cursor.close()
        db.close()

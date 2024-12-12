import json

# Load the JSON data
with open('data.json', 'r', encoding='utf-8') as file:
    data = json.load(file)

# Initialize a set to track unique usernames
usernames = set()

# New cleaned data
cleaned_data = []

for obj in data:
    # Check if the object is an auth.user entry
    if obj['model'] == 'auth.user':
        username = obj['fields']['username']
        if username.lower() in usernames:
            print(f"Duplicate found for username: {username}. Skipping...")
            continue  # Skip duplicates
        usernames.add(username.lower())

    # Add non-duplicate objects to cleaned data
    cleaned_data.append(obj)

# Save the cleaned data back to a new file
with open('clean_data.json', 'w', encoding='utf-8') as file:
    json.dump(cleaned_data, file, indent=2)

print("Cleaned data saved to 'cleaned_data.json'.")

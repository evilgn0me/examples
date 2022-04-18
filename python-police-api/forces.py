#!/usr/bin/env python3
import csv
from police_api import PoliceAPI
from police_api.forces import Force

def main():
    api = PoliceAPI()
    forces = api.get_forces()

    # creating new csv file with structure.
    with open("forces.csv", "w") as file:
        writer = csv.writer(file)
        writer.writerow(
            [
                "force id",
                "facebook page",
            ]
        )

    for dep in forces:
        # opening forces.csv in append mode.
        f = open("forces.csv", "a")
        force = Force(api, id=dep.id)
        # getting engagements methods
        engagements = force.engagement_methods
        for data in engagements:
            # searching for those who has facebook type of engagement
            if data["type"] == "Facebook":
                force_facebook = data["url"]
                csv_data = [dep.id, force_facebook]
                # appending to csv file.
                with f:
                    writer = csv.writer(f)
                    writer.writerow(csv_data)
if __name__ == '__main__':
    main()
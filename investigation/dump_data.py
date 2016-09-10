"""Script to dump some sample data to csv for investigation and analysis.
"""
from settings.config import CLIENT_ID, ACCESS_TOKEN

from stravalib.client import Client
import pandas as pd

client = Client()
authorize_url = client.authorization_url(client_id=CLIENT_ID, redirect_uri='http://localhost:8282/authorized')

client = Client(access_token=ACCESS_TOKEN)

curr_athlete = client.get_athlete()
activities = client.get_activities(limit=2)
types=['time', 'latlng', 'distance', 'altitude', 
       'velocity_smooth','watts', 'temp', 'moving', 'grade_smooth']

ride_data = []
for i_activity, activity in enumerate(activities):
    streams = client.get_activity_streams(activity.id, types=types)
    
    n_data_points = len(streams['time'].data)

    returned_streams = streams.keys()

    data_lists = [streams[k].data for k in returned_streams]
    data_lists.append(n_data_points*[i_activity])

    for i_point in xrange(n_data_points):
        ride_data.append([d[i_point] for d in data_lists])

ride_data_df = pd.DataFrame(ride_data, columns = returned_streams+['activity'])
ride_data_df.to_csv('ride_data.csv',sep=',')
import streamlit as st
import pandas as pd
from io import BytesIO
import requests

# Define player data
player_data = pd.DataFrame({
    'ID': [315691, 271, 267, 273],
    'Name': ['Ben Steinwachs', 'Phil Hellmuth', 'Dnegs', 'Phil Ivey']
})

# Define the WSOP URL
wsop_url = "https://www.wsop.com/players/profile/?playerid="

# Streamlit app
st.set_page_config(page_title="WSOP Cashes", page_icon="♠️")
st.title("WSOP Cashes ♠️	♥ ♣ ♦")
st.header("WSOP Cashes by Player ID")
st.markdown("♠️	♥ ♣  ♦")

selected_player = st.selectbox("Select WSOP Player", player_data['Name'])

player_id = player_data.loc[player_data['Name'] == selected_player, 'ID'].values[0]

if player_id:
    st.balloons()
    url = wsop_url + str(player_id)
    page = requests.get(url)
    df_list = pd.read_html(page.text)
    st.write(pd.DataFrame(df_list[0]))

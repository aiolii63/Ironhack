# -*- coding: utf-8 -*-
"""
Created on Thu Mar 24 11:17:15 2022

@author: olivi
"""

import streamlit as st
import numpy as np
import pandas as pd
import sklearn.datasets as datasets
import matplotlib.pyplot as plt

import warnings
warnings.filterwarnings("ignore")

pd.set_option("display.max_columns", 50)

breast_cancer = datasets.load_breast_cancer(as_frame=True)
breast_cancer_df = pd.concat((breast_cancer["data"], breast_cancer["target"]), axis=1)
breast_cancer_df["target"] = [breast_cancer.target_names[val] for val in breast_cancer_df["target"]]
measurements = breast_cancer_df.drop(labels=["target"], axis=1).columns.tolist()

st.set_page_config(layout="wide")

st.header('BREAST CANCER DATASET ANALYSIS                ¤)(¤')


#------------------------------------
#BUILD 2x2 COLUMN CONTAINERS FOR OUR CHARTS

container1 = st.container()

with container1:
   
    col1, col2 = st.columns(2)

    with col1:
        #Scatter chart
       
        st.sidebar.markdown("### Scatter Chart: Explore Relationship Between Measurements :")
        x_axis = st.sidebar.selectbox("X-Axis", measurements)
        y_axis = st.sidebar.selectbox("Y-Axis", measurements, index=1)

        if x_axis and y_axis:
            scatter_fig = plt.figure(figsize=(6,4))
            scatter_ax = scatter_fig.add_subplot(111)

            malignant_df = breast_cancer_df[breast_cancer_df["target"] == "malignant"]
            benign_df = breast_cancer_df[breast_cancer_df["target"] == "benign"]

            malignant_df.plot.scatter(x=x_axis, y=y_axis, s=120, c="tomato", alpha=0.6, ax=scatter_ax, label="Malignant")
            benign_df.plot.scatter(x=x_axis, y=y_axis, s=120, c="dodgerblue", alpha=0.6, ax=scatter_ax,
                           title="{} vs {}".format(x_axis.capitalize(), y_axis.capitalize()), label="Benign")
            
        st.write(scatter_fig)
        
    with col2:
        st.sidebar.markdown("### Bar Chart: Average Measurements Per Tumor Type : ")
        avg_breast_cancer_df = breast_cancer_df.groupby("target").mean()
        bar_axis = st.sidebar.multiselect(label="Average Measures per Tumor Type Bar Chart", options=measurements, default=["mean radius","mean texture", "mean perimeter", "area error"])

        if bar_axis:
            bar_fig = plt.figure(figsize=(6,4))    
            bar_ax = bar_fig.add_subplot(111)
            sub_avg_breast_cancer_df = avg_breast_cancer_df[bar_axis]
            sub_avg_breast_cancer_df.plot.bar(alpha=0.8, ax=bar_ax, title="Average Measurements per Tumor Type");

        else:
            bar_fig = plt.figure(figsize=(6,4))
            bar_ax = bar_fig.add_subplot(111)
            sub_avg_breast_cancer_df = avg_breast_cancer_df[["mean radius", "mean texture", "mean perimeter", "area error"]]
            sub_avg_breast_cancer_df.plot.bar(alpha=0.8, ax=bar_ax, title="Average Measurements per Tumor Type")

        st.write(bar_fig)


                
container2 = st.container()

with container2:
    
    
    col1, col2 = st.columns(2)

    with col1:
       st.sidebar.markdown("### Histogram: Explore Distribution of Measurements : ")
       hist_axis = st.sidebar.multiselect(label="Histogram Ingredient", options=measurements, default=["mean radius", "mean texture"])
       bins = st.sidebar.radio(label="Bins :", options=[10,20,30,40,50], index=4)

       if hist_axis:
            hist_fig = plt.figure(figsize=(6,4))
            hist_ax = hist_fig.add_subplot(111)
            sub_breast_cancer_df = breast_cancer_df[hist_axis]
            sub_breast_cancer_df.plot.hist(bins=bins, alpha=0.7, ax=hist_ax, title="Distribution of Measurements")
        
       else:
            hist_fig = plt.figure(figsize=(6,4))
            hist_ax = hist_fig.add_subplot(111)
            sub_breast_cancer_df = breast_cancer_df[["mean radius", "mean texture"]]
            sub_breast_cancer_df.plot.hist(bins=bins, alpha=0.7, ax=hist_ax, title="Distribution of Measurements")

       st.write(hist_fig)

    with col2:
        
        st.sidebar.markdown("### Hexbin Chart: Explore Concentration of Measurements :")

        hexbin_x_axis = st.sidebar.selectbox("Hexbin-X-Axis", measurements, index=0)
        hexbin_y_axis = st.sidebar.selectbox("Hexbin-Y-Axis", measurements, index=1)

        if hexbin_x_axis and hexbin_y_axis:
            hexbin_fig = plt.figure(figsize=(6,4))
            hexbin_ax = hexbin_fig.add_subplot(111)
            breast_cancer_df.plot.hexbin(x=hexbin_x_axis, y=hexbin_y_axis,
                                 reduce_C_function=np.mean,
                                 gridsize=25,
                                 #cmap="Greens",
                                 ax=hexbin_ax, title="Concentration of Measurements")
            
            
        st.write(hexbin_fig)









# PotreeConverter Docker Container

Docker container for remote builds of [PotreeConverter](https://github.com/potree/potree) by [m-schuetz](https://github.com/m-schuetz).

## Instructions

- Build image:

```
git clone https://github.com/tyson-swetnam/potree-docker
cd potree-docker
docker build -t tswetnam/potreeconverter .
```

To create, copy a LAS/LAZ file into `/input` volume in the container, and write the output directory to `/output`

```
docker run -v /vol_c/white_mountains/:/input -v /vol_c/potree:/output tswetnam/potreeconverter PotreeConverter /input/ -p 4fri -o /output/4fri --title "4FRI Phase 2" --description "2014 Aerial lidar flight over 4FRI project area"
```

## Create Potree point index

```
docker run -v /vol_c/white_mountains/:/input -v /home/tswetnam/potree/output/:/output tswetnam/potreeconverter:latest PotreeConverter /input -p 4fri -o /output/4fri --output-format LAZ --overwrite
```

## Launch Potree on localhost

```
git clone https://github.com/potree/potree

cd potree

npm install 
npm install -g gulp
```

```
gulp watch
```

Project inspired by https://github.com/sverhoeven/PotreeConverter

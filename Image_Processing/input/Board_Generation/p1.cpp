#include <iostream>

#include "opencv2/opencv.hpp" 

using namespace std;
using namespace cv;

int main( int argc, char** argv )
{
    if( argc != 2)
    {
     cout <<" Usage: display_image ImageToLoadAndDisplay" << endl;
     return -1;
    }



    Mat image;
    image = imread(argv[1], CV_LOAD_IMAGE_COLOR);   
    
    if(! image.data )                              
    {
        cout <<  "Could not open or find the image" << std::endl ;
        return -1;
    }

    Mat gray;

    cvtColor(image,gray,CV_RGB2GRAY);

    Mat bw;

    threshold(gray, bw, 200, 255.0, THRESH_BINARY);
    Rect roi(7,5,1040,1040);

    Mat bw_use = bw(roi);

    //cout<< bw.at<int>(10,150) <<endl;

    Mat el = Mat::zeros(110, 110, CV_8UC1);
    Mat bw_el;
    threshold(el, bw_el, 100, 255, THRESH_BINARY);
    Mat el_dst;
    bitwise_not ( bw_el, el_dst );
    Mat erosion_dst;
    erode(bw, erosion_dst, el_dst);
    
    //imshow("Display", erosion_dst);

    vector<Mat> channels;
    
    Mat image_use = image(roi);
    split(image_use, channels);
    
    //cout <<(int)erosion_dst.at<uchar>(324,64) <<endl;
    for(int i=0; i<=7; i++){

        int w = 64 + 130*i;  

        for(int j=0; j<=7; j++){

            int h = 64 + 130*j;

            Rect temp_roi(130*i, 130*j, 130, 130); 
            cout <<w<<endl;
            cout <<h<<endl;
            //cout <<(int)erosion_dst.at<uchar>(w,h) <<endl;
            if((int)erosion_dst.at<uchar>(w,h) == 255){
                
                channels[1](temp_roi) = Mat::zeros(130, 130, CV_8UC1);

            }else{

                channels[2](temp_roi) = Mat::zeros(130, 130, CV_8UC1);
            }

	}

    }
    
    merge(channels, image_use);

    image(roi) = image_use;

    namedWindow( "Display window", WINDOW_AUTOSIZE );
    imshow( "Display window", image );       
    //imwrite("p1_output_opencv.jpg", image);            

    waitKey(0);                                          
    return 0;
}

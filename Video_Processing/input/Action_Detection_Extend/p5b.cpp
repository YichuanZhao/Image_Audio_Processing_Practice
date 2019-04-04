// Headers
#include <opencv2/core/core.hpp> 
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/opencv.hpp>
#include <iostream>

using namespace cv;
using namespace std;


int B_MIN = 0;
int B_MAX = 255;
int G_MIN = 0;
int G_MAX = 255;
int R_MIN = 0;
int R_MAX = 255;

const string trackbarWindowName = "Trackbars";

void on_trackbar( int, void* )
{//This function gets called whenever a
	// trackbar position is changed


}

void createTrackbars(){
	//create window for trackbars


    namedWindow(trackbarWindowName,0);
	//create memory to store trackbar name on window
	char TrackbarName[50];
	sprintf( TrackbarName, "H_MIN", B_MIN);
	sprintf( TrackbarName, "H_MAX", B_MAX);
	sprintf( TrackbarName, "S_MIN", G_MIN);
	sprintf( TrackbarName, "S_MAX", G_MAX);
	sprintf( TrackbarName, "V_MIN", R_MIN);
	sprintf( TrackbarName, "V_MAX", R_MAX);
     
    createTrackbar( "B_MIN", trackbarWindowName, &B_MIN, B_MAX, on_trackbar );
    createTrackbar( "B_MAX", trackbarWindowName, &B_MAX, B_MAX, on_trackbar );
    createTrackbar( "G_MIN", trackbarWindowName, &G_MIN, G_MAX, on_trackbar );
    createTrackbar( "G_MAX", trackbarWindowName, &G_MAX, G_MAX, on_trackbar );
    createTrackbar( "R_MIN", trackbarWindowName, &R_MIN, R_MAX, on_trackbar );
    createTrackbar( "R_MAX", trackbarWindowName, &R_MAX, R_MAX, on_trackbar );


}

int trackFilteredObjectGhost(Mat threshold, vector<Point> &Ghosts){

	Mat temp;
	threshold.copyTo(temp);
	//these two vectors needed for output of findContours
	vector< vector<Point> > contours;
	vector<Vec4i> hierarchy;
	//find contours of filtered image using openCV findContours function
	findContours(temp,contours,hierarchy,CV_RETR_CCOMP,CV_CHAIN_APPROX_SIMPLE );
	//use moments method to find our filtered object
	int numObjects = hierarchy.size();
	double refArea = 0;
	int x,y;
	if (numObjects > 0) {
        
        for (int index = 0; index >= 0; index = hierarchy[index][0]){
			Moments moment = moments((cv::Mat)contours[index]);
			double area = moment.m00;
			x = moment.m10/area;
			y = moment.m01/area;

			//cout <<x <<endl;
			//cout <<y<<endl;
 			Point pt = Point(x,y);
 			Ghosts.push_back(pt);
			//if(y < 270 ){
			//	Point pt(x, y);
			//	pts.push_back(pt);

				
			//}
        	//if(area<4){
         	//	numObjects --;    	
			//}
        }

	}

	return numObjects;
}

int trackFilteredObjectPac(Mat threshold, Point &pt){

	Mat temp;
	threshold.copyTo(temp);
	//these two vectors needed for output of findContours
	vector< vector<Point> > contours;
	vector<Vec4i> hierarchy;
	//find contours of filtered image using openCV findContours function
	findContours(temp,contours,hierarchy,CV_RETR_CCOMP,CV_CHAIN_APPROX_SIMPLE );
	//use moments method to find our filtered object
	int numObjects = hierarchy.size();
	double refArea = 0;
	int x,y;
	if (numObjects > 0) {
        
        for (int index = 0; index >= 0; index = hierarchy[index][0]){
			Moments moment = moments((cv::Mat)contours[index]);
			double area = moment.m00;
			x = moment.m10/area;
			y = moment.m01/area;

			//cout <<x <<endl;
			//cout <<y<<endl;
 			pt = Point(x,y);
			//if(y < 270 ){
			//	Point pt(x, y);
			//	pts.push_back(pt);

				
			//}
        	//if(area<4){
         	//	numObjects --;    	
			//}
        }

	}

	return numObjects;
}

int trackFilteredObjectDots(Mat threshold, vector<Point> &Dots){

	Mat temp;
	threshold.copyTo(temp);
	//these two vectors needed for output of findContours
	vector< vector<Point> > contours;
	vector<Vec4i> hierarchy;
	//find contours of filtered image using openCV findContours function
	findContours(temp,contours,hierarchy,CV_RETR_CCOMP,CV_CHAIN_APPROX_SIMPLE );
	//use moments method to find our filtered object
	int numObjects = hierarchy.size();
	double refArea = 0;
	if (numObjects > 0) {
        
        for (int index = 0; index >= 0; index = hierarchy[index][0]){
			Moments moment = moments((cv::Mat)contours[index]);
			double area = moment.m00;
			int x = moment.m10/area;
			int y = moment.m01/area;
			Point Dot(x,y);
			Dots.push_back(Dot);
			//cout<<x<<" "<<y <<endl;

        	//if(area<4){
         	//	numObjects --;    	
			//}
        }

	}

	return numObjects;
}

string intToString(int number){


	std::stringstream ss;
	ss << number;
	return ss.str();
}

int main(int argc, char* argv[]) {
	
	// Load input video
	//  If your video is in a different source folder than your code, 
	//  make sure you specify the directory correctly!
	VideoCapture input_cap("input5b2.avi");

    //Mat image = imread("0.jpeg", CV_LOAD_IMAGE_COLOR);

    //Mat gray, bw_0, zero_dst;
    //cvtColor(image,gray,CV_RGB2GRAY);
    //threshold(image, bw_0, 200, 255.0, THRESH_BINARY);
	
	// Check validity of target file
	if(!input_cap.isOpened()) {
		std::cout << "Input video not found." << std::endl;
		return -1;
	}
	
	// Set up target output video
	/*	usage: VideoWriter(filename, encoding, framerate, Size)
	 *		in our case, cv_cap_prop_* means "get property of capture"
	 *	 	we want our output to have the same properties as the input!
	 */
	
	VideoWriter output_cap("output5b2.avi", 
							input_cap.get(CV_CAP_PROP_FOURCC),
							input_cap.get(CV_CAP_PROP_FPS),
							Size(input_cap.get(CV_CAP_PROP_FRAME_WIDTH),
							input_cap.get(CV_CAP_PROP_FRAME_HEIGHT)));
	
	// Again, check validity of target output file
	if(!output_cap.isOpened()) {
		std::cout << "Could not create output file." << std::endl;
		return -1;
	}
	
	// Loop to read from input one frame at a time, write text on frame, and
	// copy to output video
	namedWindow("p1a",0);
	Mat frame, frame_init, frame_threshold, frame_threshold_Dots, frame_threhsold_pre, frame_threshold_init, res, HSV, frame_threshold_Pac, frame_threshold_result;
	createTrackbars();

	Mat eh = Mat::zeros(3, 3, CV_8UC1);
    Mat ev = Mat::zeros(6, 6, CV_8UC1);
    
    Mat bw_ev, bw_eh, erosion_dst, dilate_dst;
    
    bitwise_not ( eh, bw_eh );
    bitwise_not ( ev, bw_ev );


    Mat eh_g = Mat::zeros(12, 12, CV_8UC1);
    Mat ev_g = Mat::zeros(10, 10, CV_8UC1);
    
    Mat bw_ev_g, bw_eh_g, erosion_dst_g, dilate_dst_g;
    
    bitwise_not ( eh_g, bw_eh_g );
    bitwise_not ( ev_g, bw_ev_g );

    //Mat nonZeroCoordinates;
    

    Mat output_frame = Mat::zeros(288, 224, CV_8UC3);
    int one_x, one_y;

    int init = 0;
	//while(input_cap.read(frame)) {
    
    deque<int> numDots;

    for(int i=0; i<10; i++){
    	numDots.push_back(0);
    }

    vector<Point> Dots;
    int display_time = 0;
    int display_ghost_time = 0;
    Point display_temp;
    Point display_ghost;
    vector<Point> Ghosts;
	while(1){
        input_cap >> frame;
        if(init == 0){
        	frame_init = frame.clone();    
        	//inRange(frame,Scalar(56,0,30), Scalar(178,255,95),frame_threshold_init); //p1a
    	    //inRange(frame_init,Scalar(160,170,220), Scalar(195,190,255),frame_threshold_init); //p2a
			inRange(frame,Scalar(160,170,220), Scalar(195,190,255),frame_threshold_Dots); //p2a
			erode(frame_threshold_Dots, frame_threshold_Dots, bw_eh);
			dilate(frame_threshold_Dots, frame_threshold_Dots, bw_ev);
 		    trackFilteredObjectDots(frame_threshold_Dots, Dots);

 		    inRange(frame,Scalar(56,0,30), Scalar(178,255,95),frame_threshold_init); //p1a

        	init = 1;
        }

        //cout<<frame.size().width<<endl;
	    //cout<<frame.type()<<endl;
        if(frame.empty()) break;
        //cvtColor(frame,HSV,COLOR_BGR2HSV);
        //inRange(frame,Scalar(B_MIN,G_MIN,R_MIN), Scalar(B_MAX,G_MAX,R_MAX),frame_threshold);
        //inRange(frame_init,Scalar(B_MIN,G_MIN,R_MIN), Scalar(B_MAX,G_MAX,R_MAX),frame_threshold_init);
    	

        //erode(frame_threshold, zero_dst, bw_0);
        //58 158 21 55 34 56
        //inRange(frame,Scalar(58,21,34), Scalar(158,55,56),frame_threshold);
        //inRange(frame,Scalar(56,0,30), Scalar(178,255,95),frame_threshold_init); //p1a
        //inRange(frame,Scalar(0,225,210), Scalar(205,255,255),frame_threshold); //p1b
        //inRange(frame,Scalar(160,170,220), Scalar(195,190,255),frame_threshold_Dots); //p2a
        //erode(frame_threshold_Dots, frame_threshold_Dots, bw_eh);
        //dilate(frame_threshold_Dots, frame_threshold_Dots, bw_ev);


        inRange(frame,Scalar(0,225,210), Scalar(205,255,255),frame_threshold_Pac); 
        erode(frame_threshold_Pac, frame_threshold_Pac, bw_eh);
        dilate(frame_threshold_Pac, frame_threshold_Pac, bw_ev);


        inRange(frame,Scalar(56,0,30), Scalar(178,255,95),frame_threshold);
        frame_threshold_result = frame_threshold - frame_threshold_init;

        dilate(frame_threshold_result, frame_threshold_result, bw_ev_g);
        erode(frame_threshold_result,frame_threshold_result, bw_eh_g);

        //bitwise_and(frame_threshold, frame_threhsold_pre, res);
        //erode(frame_threshold_init, frame_threshold_init, bw_eh);
        //cout<<"test"<<endl;
        //erode(frame_threshold, zero_dst, bw_0);

        //dilate(frame_threshold, frame_threshold, bw_ev);
        //dilate(zero_dst, zero_dst, bw_ev);
        //dilate(zero_dst, zero_dst, bw_ev);
        //dilate(zero_dst, zero_dst, bw_ev);
        //dilate(zero_dst, zero_dst, bw_ev);
        //dilate(zero_dst, zero_dst, bw_ev);
        
        //dilate(dilate_dst, dilate_dst, bw_eh);
        
        //findNonZero(frame_threshold, nonZeroCoordinates);
        /*
	    for (int i = 0; i < nonZeroCoordinates.total(); i++ ) {
	    	one_x = nonZeroCoordinates.at<Point>(i).x;
	    	one_y = nonZeroCoordinates.at<Point>(i).y;
	    	//cout<<output_frame.at<Vec3f>(one_x, one_y, 1)<<endl;
	    	output_frame.at<Vec3f>(one_x, one_y, 0) = frame.at<Vec3f>(one_x, one_y, 0);
	    	//output_frame.at<Vec3f>(one_x, one_y, 1) = frame.at<Vec3f>(one_x, one_y, 1);
	    	//output_frame.at<Vec3f>(one_x, one_y, 2) = frame.at<Vec3f>(one_x, one_y, 2);
	    }
	    */
	    /*
	    for(int i=0; i<288; i++){
	    	for(int j=0; j<224; j++){
	    		if((int)frame_threshold_init.at<uchar>(i,j) == 255){
	    			frame.at<Vec3b>(i, j)[0] = 0;
	    			frame.at<Vec3b>(i, j)[1] = 255;
	    			frame.at<Vec3b>(i, j)[2] = 0;
	    		}

	    	}

	    }
	    */

		//putText(frame, "Hello World!",
		//		Point(0, 50),
		//		FONT_HERSHEY_PLAIN,
		//		1.0,
		//		Scalar(255, 255, 255));
		//cout << B_MIN<<endl;
        //frame_threhsold_pre = res;

        
        Point pt;
        trackFilteredObjectPac(frame_threshold_Pac, pt);

        vector<Point> Ghosts_temp;
        trackFilteredObjectGhost(frame_threshold_result, Ghosts_temp);

        
        cout<<pt<<endl;
        cout<<Ghosts<<endl;
        //cout<<"time"<<display_ghost_time<<endl;

        /* 
        for(int i=0; i<Dots.size(); i++){
        	Point temp = Dots[i];

        	if((pt.x > temp.x-10 && pt.x <temp.x + 10) && ( pt.y > temp.y-10 && pt.y < temp.y + 10 )){
        		display_time = 30;
        		display_temp = temp;
        		//rectangle(frame, Point(temp.x -10, temp.y - 10), Point(temp.x + 10, temp.y + 10), cv::Scalar(255, 255, 255), 1, 8, 0);
        		Dots.erase(Dots.begin()+i);

        	}

        }
        */
        if(pt.y == 278){
        	pt = Point(0,0);
        }
        if(display_ghost_time == 0){
	        for(int i=0; i<Ghosts.size(); i++){
	        	//Point temp = Ghosts[i];

	        	//if((pt.x > temp.x-12 && pt.x <temp.x + 12) && ( pt.y > temp.y-12 && pt.y < temp.y + 12 )){
	        	if(pt.x ==0 && pt.y == 0){
	        		display_ghost_time = 30;


	        		for(int j=0; j<Ghosts_temp.size(); j++){
	        			Point j_temp = Ghosts_temp[j];
	        			for(int k=0; k<Ghosts.size(); k++){
	        				Point k_temp = Ghosts[k];
	        				if((k_temp.x > j_temp.x-10 && k_temp.x <j_temp.x + 12) && ( k_temp.y > j_temp.y-12 && k_temp.y < j_temp.y + 12 )){
	        					Ghosts.erase(Ghosts.begin() + k);
	        				}
	        			}
	        		}
	        		display_ghost = Ghosts[0];
					//cout<<"index"<<i<<endl;
					//cout<<temp<<endl;
					break;
	        		//rectangle(frame, Point(temp.x -10, temp.y - 10), Point(temp.x + 10, temp.y + 10), cv::Scalar(255, 255, 255), 1, 8, 0);
	        		//Ghosts.erase(Ghosts.begin()+i);

	        	}

	        }
        } 

 		Ghosts.clear();
 		for(int i=0; i<Ghosts_temp.size(); i++){
 			Ghosts.push_back(Ghosts_temp[i]);
 		}
        //numDots.push_back(update_dots);
        //numDots.pop_front();
        //int max_val = 0;
        //for(int i=0; i<10; i++){
        //    if(numDots[i] > max_val){
        //    	max_val = numDots[i];
        //    }
        //}
        //cout<<max_val<<endl;
        //putText(frame,intToString(max_val),Point(200,20),1,1,Scalar(0,255,0),1);
        /*
        if(display_time > 0){
        	rectangle(frame, Point(display_temp.x -10, display_temp.y - 10), Point(display_temp.x + 10, display_temp.y + 10), cv::Scalar(255, 255, 255), 1, 8, 0);
        	display_time--;
        }
        */

        if(display_ghost_time > 0){
        	rectangle(frame, Point(display_ghost.x -10, display_ghost.y - 10), Point(display_ghost.x + 10, display_ghost.y + 10), cv::Scalar(255, 255, 255), 1, 8, 0);
        	display_ghost_time--;
        }
        output_cap.write(frame);

		imshow("p1a", frame);
		//imshow("output", output_frame);
		imshow("threshold", frame_threshold_result);
		//imshow("threshold_zero", zero_dst);
		//imshow("threshold1", dilate_dst);
		//output_cap.write(frame);
		int key = waitKey(10);
		if(key == 27) break;
	}
	

	// free the capture objects from memory
	input_cap.release();
	output_cap.release();
	//return 1;
	
}

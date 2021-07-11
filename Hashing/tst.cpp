#include <stdio.h>
#include <iostream>
#include <fstream>
#include <thread>
#include <string>
#include <vector>
#include <mutex>
#include <stdlib.h>
using namespace std;

char H[2100][5000][50]; 
int tops[2100]= {0, };

//static mutex mymutex;
static mutex mymutex[1];
void thread_function(int count){
    mymutex[0].lock();
    for(int i = 0; i < count; ++i){
        //cout << i << "\n";
        this_thread::sleep_for(chrono::milliseconds(10));
    }
    mymutex[0].unlock();
}


void insertWord(string w){
        int sm = 0;
        for(int i=0; i<w.size(); i++){
            sm+= (int)w[i];
            cout<<w[i];
        }
        //printf("%d\n", sm);
        sm%=2069;
        printf("%d\n", sm);
        //mymutex[0].lock();
        ++tops[sm];
        for(int i=0; i<w.size(); i++){
            H[sm][tops[sm]][i]= w[i];
        }
        printf("%s", H[sm][tops[sm]]);
        //strcpy(H[sm][tops[sm]++], w.c_str());
        //++tops[sm];
        //mymutex[0].unlock();
    return;
}


int main(){
    fill(&H[0][0][0], &H[2099][4999][50], '\0'); 
    fill(&tops[0], &tops[2100], -1); // ++top 

    //thread _t1(thread_function, 10);
    //thread _t2(thread_function, 10);
    //_t1.join();
    //_t2.join();
    //cout <<"main_process"<<"\n";
    string s = "hello";
    printf("%s\n", H[0][tops[0]]);
    //cout <<"main_process"<<"\n";
    insertWord(s);

}
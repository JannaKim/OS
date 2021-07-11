#include <stdio.h>
#include <iostream>
#include <fstream>
#include <thread>
#include <string>
#include <vector>
#include <mutex>
#include <cstdlib>
#define num_threads 30
using namespace std;
char H[2100][5000][50]; //(2069, vector<string>);
int tops[2100];

static mutex mymutex[2069];
// 각 쓰레드의 valid check가 유효한지 저장하기 위한 int list
// 0이면 valid, 1이면 invalid
int valid[num_threads] = {0,};

/*
void thread_function(int count){
    for(int i = 0; i < count; ++i){
        cout << i << "\n";
        this_thread::sleep_for(chrono::milliseconds(10));
    }
}
*/
//[0, 0, 0, 0, 0, 0, 0, ]
void insertWord(string w){


        int sm = 0;
        for(int i=0; i < w.size(); i++){
            sm+= (int)w[i];
        }
        sm%=2069;
        
        /*
        for(int i=0; w.size(); i++){
            H[sm][tops[sm]][i]= w[i];
        }
        */
       int myloc = 0;
        mymutex[sm].lock();
        myloc = ++tops[sm];
        mymutex[sm].unlock();
        
        for(int i = 0 ; i < w.size(); ++i)
        {
            H[sm][myloc][i] = w[i];
        }
        
        //printf("%s", H[sm][tops[sm]]);
        
       //strcpy(H[sm][++tops[sm]], w.c_str());
        
        
    return;
}

void isValid(string w) {
    int sm = 0;
    for(int i=0; i< w.size(); i++){
        sm+= (int)w[i];
        //printf("%c", chkFile[i]);
    }
    //printf()
    sm%=2069;
    bool flag = false;
    char tmp[50];
    fill(&tmp[0], &tmp[50], '\0'); 
    for(int i = 0; i < w.size(); ++i){
        tmp[i] = w[i];
    }
    for(int i = 0; i < tops[sm] + 1; ++i){// top error
        if(strcmp(H[sm][i], tmp) == 0){
            flag = true;
            break;
        }
       //printf("%s?\n", H[sm][i]);

    }
    if(flag == true){
        cout << w << " found\n";
    }
    return;
}


int main()
{
    //H[2100][5000][50];
    fill(&H[0][0][0], &H[2099][4999][50], '\0'); 
    fill(&tops[0], &tops[2100], -1); // ++top 

    thread * threadpointer = new thread[num_threads];
    int threadIndex = 0;

    string myFile; // longest word 45
    ifstream fin("input");
    if (!fin) {
      cout << "File could not be opened." << '\n';
      return 1;
   } 

    while( ! fin.eof()){
        fin >> myFile;
        //cout << myFile << "\n";
        threadpointer[threadIndex++] = thread(insertWord, myFile);
        if(threadIndex >= num_threads){
            for(int i = 0; i < num_threads; ++i){
                threadpointer[i].join();
            }
            threadpointer = new thread[num_threads];
            threadIndex = 0;
        }
    }

    fin.close();

    for(int i = 0; i < num_threads; ++i){
       threadpointer[i].join();
    }
    
    string chkFile; 
    ifstream fin2("commonwords3000");
    if (!fin2) {
      cout << "File could not be opened." << '\n';
      return 1;
    }     


    
    for(int i = 0; i < num_threads; ++i){
        
    }
    threadIndex = 0;
    thread * threadpointer2 = new thread[num_threads];
    while( ! fin2.eof()){
        fin2 >> chkFile;
        //cout << chkFile << "\n";
        //threads[threadIndex](isValid)
        threadpointer2[threadIndex++] = thread(isValid, chkFile);

        if(threadIndex >= num_threads){
            for(int i = 0; i < num_threads; ++i){
                threadpointer2[i].join();
            }
            threadpointer2 = new thread[num_threads];
            threadIndex = 0;
        }
    }

    fin2.close();
    
    
    //thread _t1(thread_function, 10);
    //thread _t2(thread_function, 10);

    

    //_t1.join();
    // for(int i = 0; i < 2100; i++){
    //     cout<<tops[i]<<' ';
    // }
    cout <<"main_process"<<"\n";
    //_t2.join();
    

    return 0;
}


    /*
    for(int i = 0 ; i < H.size(); ++i){
        if(H[i].size() > 0){
            for(int j = 0; j < H[i].size(); ++j)
                cout << H[i][j]<<'\n';
                }
    }
    */
    //ofstream fout("output.txt");
    //fout << "hello world\n";
    //fout.put('A');
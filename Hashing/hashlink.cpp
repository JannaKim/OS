#include <stdio.h>
#include <iostream>
#include <fstream>
#include <thread>
#include <string>
#include <vector>
#include <mutex>
#include <cstdlib>
#include <stdlib.h>
// #include "linkedlist.h" ?
#define num_threads 2069
using namespace std;

template <typename T>
struct Node{
    public:
        T data;
        struct Node<T> *next = nullptr;
};

template <typename T>
class SingleLinked_List
{
    private:
        Node<T> *head;
        Node<T> *tail;
        int size = 0;
    public:
        SingleLinked_List(): head(nullptr), tail(nullptr) {}//생성자
        ~SingleLinked_List() {} //소멸자

        void AddNode(T  _data)
        {
            Node<T> *node = new Node<T>;
            ++size;
            node->data = _data;
            node->nect = nullptr;

            if(head == nullptr){
                head = node;
                tail = node;
            }
            else{
                tail->next = node;
                tail = tail->next;
            }
        }

        void RemoveNode(T _data){
            Node<T> *ptr = head;
            Node<T> *tmp = ptr;

            while(ptr != nullptr){
                if(ptr -> data == _data) break;
                else{
                    tmp = ptr; // 이전노드
                    ptr = ptr -> next;
                }
            }
            if(ptr == nullptr) cout << "not found"<<'\n';
            else{
                --size;
                cout << "deleted: "<< ptr->data <<"\n";
                tmp->next = ptr->next; // 빼고 연결
                delete ptr; // 동적할당 해제
            }
        }

        void SearchValue(T _data){
            Node<T> *ptr = head;
            int index = 0;
            bool isFound = false;

            while(ptr != nullptr){
                ++index;
                if(ptr->data == _data){
                    cout << _data <<" found"<<'\n';
                    isFound = true;
                    break;
                }
                ptr = ptr->next;
            }

            if(isFound == false) cout << "not found"<<'\n';

        }

        void DeleteList(){
            Node<T> *ptr = head;

            while(ptr != nullptr){
                head = ptr->next;
                delete ptr;
                ptr = head;
            }
            delete head;
            size = 0;
            cout << "list deleted"<<'\n';
        }



};

SingleLinked_List H[2100]; //[5000][50]; //(2069, vector<string>);
int tops[2100];
static mutex mymutex[2069];

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
        //int myloc = 0;
        mymutex[sm].lock();
        H[sm].AddNode(w);
        //myloc = ++tops[sm];
        mymutex[sm].unlock();
        
        
        /*
        for(int i = 0 ; i < w.size(); ++i)
        {
            
            H[sm][myloc][i] = w[i];
        }
        */
        
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
    H[sm].SearchValue(w);
    /*
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
    */
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
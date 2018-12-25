bool hasPlace(int queenCol[8], int curNum, int curRow){
    bool flag = true;
    for(int i = 0; i < curRow; i++){
        if(curNum == queenCol[i]){
            flag = false;
            break;
        }
        if((curRow-i) == (curNum-queenCol[i]) || (i-curRow) == (curNum-queenCol[i])){
            flag = false;
            break;
        }
    }
    return flag;
}

void PrintPlace(int queenCol[8]){
    std::cout << std::endl;
    std::cout << "=====================" << std::endl;

    for(int i = 0; i < 8; i++){
        for(int j = 0; j < queenCol[i]; j++){
            std::cout << "* ";
        }
        std::cout << "Q" << " ";
        if(queenCol[i] != 7){
            for(int j = queenCol[i]+1; j < 8; j++){
                std::cout << "* ";
            }
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

void FindPlace(int queenCol[8], int curRow){
    if(curRow == 8){
        PrintPlace(queenCol);
        return;
    }
    for(int i = 0; i < 8; i++){
        if(hasPlace(queenCol, i, curRow)) {
            queenCol[curRow] = i;
            FindPlace(queenCol, curRow + 1);
        }
    }
}

int main(){

    int queenCol[8];
    for(int i : queenCol){
        i = 0;
    }

    FindPlace(queenCol, 0);
    
}
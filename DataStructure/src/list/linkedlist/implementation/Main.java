package list.linkedlist.implementation;

public class Main {

	public static void main(String[] args) {
		int[] numbers1 = new int[4];
		
		String[] strings = new String[4];
		
		numbers1[0]=10;
		numbers1[1]=20;
		numbers1[2]=30;
		
		int[] numbers2 = {10, 20, 30, 40};
		int[] numbers3 = new int[]{10, 20, 30, 40};
		
		System.out.println("System.out.println(numbers1[0]);");
		System.out.println(numbers1[0]);
		
		System.out.println("System.out.println(numbers1[3]);");
		System.out.println(numbers1[3]); //설정하지 않은 값에 대해서는 0 출력 (기본값 0)
		
		System.out.println("System.out.println(numbers1.length);");
		System.out.println(numbers1.length); // 설정한 값들의 개수가 아니라 배열을 구성하는 값을 의미함.
		
		System.out.println("while");
		int i=0;
		while(numbers1.length > i){
			System.out.println(numbers1[i]);
			i++;
		}
		
		System.out.println("for");
		for(i=0; numbers1.length>i; i++){
			System.out.println(numbers1[i]);
		}
    }
}

class Test 
{
	private int a,b ;
	public void SetData()
	{
		a=13;
		b=5;
	}
	public void ShowDate()
	{
		System.out.print(a + "\t" + b) ;
	}
}

class Demo
{
	public static void main(String[] args)
	{
		Test ob = new Test();
			ob.SetData();
			ob.ShowDate();
	}
}

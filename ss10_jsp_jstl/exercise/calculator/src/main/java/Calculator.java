public class Calculator {
    private Float first_number;
    private Float last_number;
    private String operator;

    public Calculator(){}

    public static float calculate(float first_number, float last_number, String operator) throws Exception {
        float result=0;
        switch (operator){
            case "+":
                result=first_number+last_number;
                break;
            case "-":
                result=first_number-last_number;
                break;
            case "*":
                result=first_number*last_number;
                break;
            case "/":
                if (last_number==0){
                        throw new Exception("lỗi");
                } else {
                    result = first_number / last_number;
                }
                    break;

        }
        return result;
    }

}

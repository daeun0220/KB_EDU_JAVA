package spring.aop.anno;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

/*
 * 부수적인 관심사만 모아놓은 클래스...
 * Advice Class....Cross Cutting Concern
 * :: 
 * Annotation 으로 만든다는 의미는 aop설정을 코드로 작성한다는 의미
 * 
 * <aop:config> 설정부분은 이제 xml에서 사라진다 !
 */

@Aspect
public class LoggingAdvice {
	private Log log = LogFactory.getLog(getClass());
	
	// target 메소드의 리턴타입이 String이고 spring 패키지 아래에 있는 모든 하위 패키지 중
	// 클래스 이름이 product 로 시작하는 클래스 중 함수명이 delete로 시작하고.... 인자값이 1개 이상인 
	// 이 pointcut 설정하는 방법 중 Annotation 사용한거!! 
	@Around("execution(String spring..Product*.delete*(..))")
	public void logPush(ProceedingJoinPoint pjp) throws Throwable{
        log.info("\ncheck...before logging...");

        Object ret=pjp.proceed();//target으로 위빙되는 시점
        System.out.println("target method return..."+ret);
	}
}

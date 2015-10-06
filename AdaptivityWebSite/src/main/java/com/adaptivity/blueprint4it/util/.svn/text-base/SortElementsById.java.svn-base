/**
 * 
 */
package com.adaptivity.blueprint4it.util;

import java.lang.reflect.Method;
import java.util.Comparator;

import com.adaptivity.blueprint4it.web.common.Constants;

/**
 * @author sunila
 *
 */
public class SortElementsById implements Comparator<Object> {

	public int compare(Object o1, Object o2) {

		Long id1 = getIdObj(o1);
		Long id2 = getIdObj(o2);
		if (id1 > id2) {
			return 1;
		} else if (id1 < id2) {
			return -1;
		}
		return 0;
	}

	private Long getIdObj(Object o) {
		Object result = null;
		try {
			Class klass = o.getClass();
			Method getIdMethod = klass.getMethod(Constants.GET_ID, null);
			result = getIdMethod.invoke(o, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Long.valueOf(result.toString());

	}

}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hrms.manage.tjbb;

import com.hrms.manage.zyjsrc.*;
import com.hrms.util.Util;
import org.jplus.hyb.database.Hyberbin;


/**
 *
 * @author star
 */
public class Empty {

    public String empth(String ss, String str, Hyberbin hyb) {
        if (Util.isEmpty(str)) {
            return "";
        } else {
            hyb.addParmeter(str);
            return " and " + ss + "=? ";
        }
    }

    public String emys(String name, String value, String checked, Hyberbin hyb) {
        if (!isEmpty(value)) {
            hyb.addParmeter(value);
            if (isEmpty(checked)) {
                return " and " + name + "=? ";
            } else {
                return " and " + name + ">=? ";
            }
        } else {
            return "";
        }
    }

    public boolean isEmpty(String s) {
        if (s == null || "".equals(s)) {
            return true;
        }
        return false;
    }
}

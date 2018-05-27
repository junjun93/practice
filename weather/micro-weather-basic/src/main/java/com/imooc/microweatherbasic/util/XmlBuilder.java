package com.imooc.microweatherbasic.util;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

/**
 * @author junjun
 * @date 2018/3/30
 **/
public class XmlBuilder {

    public static Object xmlStrToObject(Class<?> clazz, String xmlStr) throws JAXBException, IOException {

        Object xmlObject = null;
        Reader reader = null;
        // 理解这三行
        JAXBContext context = JAXBContext.newInstance(clazz);

        // XML转为对象的接口
        Unmarshaller unmarshaller = context.createUnmarshaller();

        reader = new StringReader(xmlStr);
        xmlObject = unmarshaller.unmarshal(reader);

        if(reader != null){
            reader.close();
        }
        return xmlObject;
    }
}

/*



 */
package com.xxs.definedweek.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.xxs.definedweek.CommonAttributes;
import com.xxs.definedweek.Template;
import com.xxs.definedweek.Template.Type;
import com.xxs.definedweek.service.TemplateService;

import org.apache.commons.io.FileUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;

/**
 * Service - 模板
 * 


 */
@Service("templateServiceImpl")
public class TemplateServiceImpl implements TemplateService, ServletContextAware {

	/** servletContext */
	private ServletContext servletContext;

	@Value("${template.loader_path}")
	private String[] templateLoaderPaths;

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@SuppressWarnings("unchecked")
	@Cacheable("template")
	public List<Template> getAll() {
		try {
			File definedweekXmlFile = new ClassPathResource(CommonAttributes.DEFINEDWEEK_XML_PATH).getFile();
			Document document = new SAXReader().read(definedweekXmlFile);
			List<Template> templates = new ArrayList<Template>();
			List<Element> elements = document.selectNodes("/definedweek/template");
			for (Element element : elements) {
				Template template = getTemplate(element);
				templates.add(template);
			}
			return templates;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Cacheable("template")
	public List<Template> getList(Type type) {
		if (type != null) {
			try {
				File definedweekXmlFile = new ClassPathResource(CommonAttributes.DEFINEDWEEK_XML_PATH).getFile();
				Document document = new SAXReader().read(definedweekXmlFile);
				List<Template> templates = new ArrayList<Template>();
				List<Element> elements = document.selectNodes("/definedweek/template[@type='" + type + "']");
				for (Element element : elements) {
					Template template = getTemplate(element);
					templates.add(template);
				}
				return templates;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		} else {
			return getAll();
		}
	}

	@Cacheable("template")
	public Template get(String id) {
		try {
			File definedweekXmlFile = new ClassPathResource(CommonAttributes.DEFINEDWEEK_XML_PATH).getFile();
			Document document = new SAXReader().read(definedweekXmlFile);
			Element element = (Element) document.selectSingleNode("/definedweek/template[@id='" + id + "']");
			Template template = getTemplate(element);
			return template;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String read(String id) {
		Template template = get(id);
		return read(template);
	}

	public String read(Template template) {
		String templatePath = servletContext.getRealPath(templateLoaderPaths[0] + template.getTemplatePath());
		File templateFile = new File(templatePath);
		String templateContent = null;
		try {
			templateContent = FileUtils.readFileToString(templateFile, "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return templateContent;
	}

	public void write(String id, String content) {
		Template template = get(id);
		write(template, content);
	}

	public void write(Template template, String content) {
		String templatePath = servletContext.getRealPath(templateLoaderPaths[0] + template.getTemplatePath());
		File templateFile = new File(templatePath);
		try {
			FileUtils.writeStringToFile(templateFile, content, "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取模板
	 * 
	 * @param element
	 *            元素
	 */
	private Template getTemplate(Element element) {
		String id = element.attributeValue("id");
		String type = element.attributeValue("type");
		String name = element.attributeValue("name");
		String templatePath = element.attributeValue("templatePath");
		String staticPath = element.attributeValue("staticPath");
		String description = element.attributeValue("description");

		Template template = new Template();
		template.setId(id);
		template.setType(Type.valueOf(type));
		template.setName(name);
		template.setTemplatePath(templatePath);
		template.setStaticPath(staticPath);
		template.setDescription(description);
		return template;
	}

}
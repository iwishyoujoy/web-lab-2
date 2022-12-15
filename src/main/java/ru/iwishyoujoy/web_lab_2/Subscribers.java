package ru.iwishyoujoy.web_lab_2;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

import java.io.IOException;

public class Subscribers {
    public static String getCountTelegram(){
        try(WebClient client = new WebClient()) {
            client.getOptions().setCssEnabled(false);
            client.getOptions().setJavaScriptEnabled(false);

            String searchUrl = "https://t.me/itmoru";
            HtmlPage page = client.getPage(searchUrl);

            HtmlElement item = page.getFirstByXPath("//div[@class='tgme_page_extra']");
            int number = Integer.parseInt(item.asNormalizedText().replaceAll("[^0-9]", ""));

            return setForm(number);

        } catch (IOException e) {
            return "Something gone wrong";
        }
    }

    public static String getCountVk(){
        try(WebClient client = new WebClient()) {
            client.getOptions().setCssEnabled(false);
            client.getOptions().setJavaScriptEnabled(false);
            client.setRefreshHandler((page, url, i) -> {});

            String searchUrl = "https://vk.com/iwishyoujoy_photo";
            HtmlPage page = client.getPage(searchUrl);

            HtmlElement item = page.getFirstByXPath("//*[@id='public_followers']");
            int number = Integer.parseInt(item.asNormalizedText().replaceAll("[^0-9]", ""));

            return setForm(number);

        } catch (IOException e) {
            return "Something gone wrong";
        }
    }

    public static String setForm(int numberOfSubscribers){
        if (numberOfSubscribers%10 == 1){
            return (numberOfSubscribers + " подписчик");
        }
        if (numberOfSubscribers%10 == 2 || numberOfSubscribers%10 == 3 || numberOfSubscribers%10 == 4){
            return (numberOfSubscribers + " подписчика");
        }
        else{
            return (numberOfSubscribers + " подписчиков");
        }
    }
}

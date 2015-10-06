package com.adaptivity.blueprint4it.util;

import java.net.URL;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import com.sun.cnpi.rss.elements.Item;
import com.sun.cnpi.rss.elements.Rss;
import com.sun.cnpi.rss.parser.RssParser;
import com.sun.cnpi.rss.parser.RssParserFactory;

public class RssFeedParser {

	private Rss rss;
	private Collection<Item> itemCollection;
	private List<RSSItemVO> voList = new LinkedList<RSSItemVO>();
	private List<RSSItemVO> voListSize = new LinkedList<RSSItemVO>();

	public Rss parse(String url) {
		try {
			RssParser parser = RssParserFactory.createDefault();
			rss = parser.parse(new URL(url));
			getItems(rss);
			System.out.println(rss);
			System.out.println(rss.getChannel().getItems());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rss;
	}

	public void getItems(Rss rss) {
		itemCollection = rss.getChannel().getItems();
	}

	public List<RSSItemVO> getItemVOCollection() {
		//voList.clear();
		if (itemCollection != null) {
			for (Item item : itemCollection) {
				RSSItemVO rssItemVO = new RSSItemVO();
				if (item.getTitle() != null) {
					rssItemVO.setTitle(item.getTitle().getText());
				} else {
					rssItemVO.setTitle("");
				}
				if (item.getLink() != null) {
					rssItemVO.setLink(item.getLink().getText());
				} else {
					rssItemVO.setLink("");
				}
				if (item.getDescription() != null) {
					rssItemVO.setDescription(item.getDescription().getText());
				} else {
					rssItemVO.setDescription("");
				}
				voList.add(rssItemVO);
			}
		}
		return voList;
	}
	
	public List<RSSItemVO> getItemVOCollectionOfSize(int size) {
		//voList.clear();
		if (itemCollection != null) {
			int counter = 0;

			for (Item item : itemCollection) {
				if (counter < size) {
					RSSItemVO rssItemVO = new RSSItemVO();
					if (item.getTitle() != null) {
						rssItemVO.setTitle(item.getTitle().getText());
					} else {
						rssItemVO.setTitle("");
					}
					if (item.getLink() != null) {
						rssItemVO.setLink(item.getLink().getText());
					} else {
						rssItemVO.setLink("");
					}
					if (item.getDescription() != null) {
						rssItemVO.setDescription(item.getDescription()
								.getText());
					} else {
						rssItemVO.setDescription("");
					}
					voListSize.add(rssItemVO);
					counter++;
				} else {
					break;
				}
			}
		}
		return voListSize;
	}
	
}

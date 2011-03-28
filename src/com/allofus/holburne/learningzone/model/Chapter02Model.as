package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.MenuButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter02Model extends AbstractChapterModel
	{
		public function Chapter02Model()
		{
			_menuVOs = new Vector.<MenuButtonVO>();
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_1"})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Bruenhal Family</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>Who's Who?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_2_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>The Family Workshop</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_2_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Other Bruenhal works</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_2_3"})
					]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>What's Going On</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>The Scene</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_3_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>What are all those things?</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_3_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Other versions of this scene</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_3_3"})	
				]})
			);
			
			_menuVOs.push
			(
				new MenuButtonVO({label:"<p class='buttonLabel'>The Paintings History</p>", subMenuButtons:new <MenuButtonVO>[
					new MenuButtonVO({label:"<p class='buttonLabel'>The Problem</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_4_1"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Work in Progress</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_4_2"}),
					new MenuButtonVO({label:"<p class='buttonLabel'>Before & After</p>", action:MenuButtonVO.SHOW_SLIDE, actionParams:"2_4_3"})
				]})
			);
			
			super();
		}
		
		
	}
}

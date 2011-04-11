package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter19Model extends AbstractChapterModel
	{
		public function Chapter19Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"19_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Looking in Detail</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Looking in Detail</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"19_2_1"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>About Hillerbrandt</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>About Hillerbrandt</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"19_3_1"})
				]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>How the Item is Used</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>How the Item is Used</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"19_4_1"})
				]})
			);			
			
			super();
		}
		
		
	}
}

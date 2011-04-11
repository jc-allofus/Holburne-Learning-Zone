package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter11Model extends AbstractChapterModel
	{
		public function Chapter11Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"11_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Works by Giambologna</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Hendrick Goltzius</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"11_2_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>The Rape of the Sabine Women</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"11_2_2"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Examples of the Crouching Venus</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Crouching Venus in the Louvre</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"11_3_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>British Collection</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"11_3_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Sir Paul Rubens</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"11_3_3"})
				]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Holburne Museum Venus</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Holburne Museum Venus</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"11_4_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Video</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"11_4_2"})
				]})
			);
			
			super();
		}
		
		
	}
}

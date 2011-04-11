package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter13Model extends AbstractChapterModel
	{
		public function Chapter13Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"13_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>More About the Sculpture</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Video</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"13_2_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>About Plura</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"13_2_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Pietà</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"13_2_3"})
					]})
			);
			
			super();
		}
		
		
	}
}

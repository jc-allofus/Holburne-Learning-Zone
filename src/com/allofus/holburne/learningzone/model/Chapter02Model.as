package com.allofus.holburne.learningzone.model
{
	import com.allofus.holburne.learningzone.model.vo.ButtonVO;

	/**
	 * @author jc
	 */
	public class Chapter02Model extends AbstractChapterModel
	{
		public function Chapter02Model()
		{
			_menuVOs = new Vector.<ButtonVO>();
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Introduction</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_1"})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>The Bruegel Family</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>Who's Who?</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_2_1"}),
//					new ButtonVO({label:"<p class='buttonLabel'>The Family Workshop</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_2_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>The Family Workshop</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_2_3"})
					]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>A Closer Look</p>", subMenuButtons:new <ButtonVO>[
					new ButtonVO({label:"<p class='buttonLabel'>The Scene</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_3_1"}),
					new ButtonVO({label:"<p class='buttonLabel'>Around the Farmhouse</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_3_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Other Versions</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_3_3"})	
				]})
			);
			
			_menuVOs.push
			(
				new ButtonVO({label:"<p class='buttonLabel'>Cleaning and Conserving</p>", subMenuButtons:new <ButtonVO>[
//					new ButtonVO({label:"<p class='buttonLabel'>The Problem</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_4_1"}),
//					new ButtonVO({label:"<p class='buttonLabel'>Work in Progress</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_4_2"}),
					new ButtonVO({label:"<p class='buttonLabel'>Before & After</p>", action:ButtonVO.SHOW_SLIDE, actionParams:"2_4_3"})
				]})
			);
			
			super();
		}
		
		
	}
}

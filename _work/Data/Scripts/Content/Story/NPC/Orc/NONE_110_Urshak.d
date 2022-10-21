INSTANCE  NONE_110_Urshak	(Mst_Default_OrcShaman)			
{
	//-------- primary data --------
	name 		=		"Ur-Shak";
	guild 		=		GIL_FRIENDLY_ORC;	
	id 			=		110;
	voice 		=		18;
	flags	 	=		0;
	Npctype 	=		NPCTYPE_MAIN;

	Mdl_SetVisual		(self,	"Orc.mds");
	Mdl_SetVisualBody	(self,	"Orc_BodyShaman",DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);

	fight_tactic	=	FAI_ORC;

	//------------- ai -------------
	daily_routine 	= Rtn_PreStart_110;
};
 
FUNC VOID Rtn_PreStart_110 ()
{	
	TA_Stand_WP  	(08,00,22,00,"OW_PATH_340");
    TA_Stand_WP		(22,00,08,00,"OW_PATH_340");
};
 
FUNC VOID Rtn_Start_110 ()
{	
	TA_Stand_WP 	(08,00,22,00,"OW_HOSHPAK_04");
    TA_Stand_WP		(22,00,08,00,"OW_HOSHPAK_04");
};


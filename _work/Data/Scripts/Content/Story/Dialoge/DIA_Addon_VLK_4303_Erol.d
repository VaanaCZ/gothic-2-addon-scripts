///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Erol_EXIT   (C_INFO)
{
	npc         = VLK_4303_Addon_Erol;
	nr          = 999;
	condition   = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Erol_PICKPOCKET (C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 900;
	condition	= DIA_Addon_Erol_PICKPOCKET_Condition;
	information	= DIA_Addon_Erol_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Erol_PICKPOCKET_Condition()
{
	C_Beklauen (43, 42);
};
 
FUNC VOID DIA_Addon_Erol_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
	
func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Hallo		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Hallo_Condition;
	information	 = 	DIA_Addon_Erol_Hallo_Info;

	description	 = 	"Co se dêje?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Co se dêje?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(naštvanê) Co se dêje? Jen se koukni na ten binec tady pod tím mostem.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(naštvanê) Nêco takovýho jsem v životê nevidêl. Ty svinê by mêl nêkdo zlikvidovat, to ti povím.
};

///////////////////////////////////////////////////////////////////////
//	Info what
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_what		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_what_Condition;
	information	 = 	DIA_Addon_Erol_what_Info;

	description	 = 	"Co se stalo?";
};

func int DIA_Addon_Erol_what_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_what_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Co se stalo?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Byl jsem se svejma pomocníkama zrovna na cestê, když mi zèistajasna na vùz skoèily tyhle hnusný bestie a každýho zabily.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Mám kliku, že jsem ještê nezapomnêl pravej hák, jinak by bylo taky po mnê.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Obchodník Erol se stal obêtí banditù, kteâí se utáboâili u mostu poblíž hospody U Mrtvé harpyje. Sebrali mu všechno jeho zboží, vèetnê jakýchsi cenných kamenných desek. Erol by byl velmi rád, kdybych mu je pâinesl zpêt."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Tady ty vêci jsou tvoje?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kdo byli ti lidé?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Ty vêci pod mostem jsou tvoje?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Vùz, zboží, všecko.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Koukni, nêjaké vêci jsem ti našel.
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Mùžeš si je nechat. Teë už pro mê vêci žádnou cenu nemají.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Ale pro mê už žádnou cenu nemá vlastnê nic.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Jediná nenahraditelná vêc, kterou mi sebrali, jsou tâi kamenný tabulky.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kamenné tabulky?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Kamenné tabulky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Slíbil jsem jednomu vodnímu mágovi z mêsta, že mu je pâinesu – chtêl je ode mê koupit.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Musím je získat zpátky za každou cenu, jinak bude moje povêst v tahu.

	Info_AddChoice	(DIA_Addon_Erol_what, "Kde jsi získal ty kamenné tabulky?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Co s nimi mágové vody chtêjí dêlat?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Co s nimi chce dêlat?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Prý je chce studovat, a tak mê požádal, abych mu pâinesl ještê další.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Kde jsi našel ty kamenné tabulky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Bejvaji u starejch budov, jako jsou mauzolea. A obèas taky v jeskyních.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Už jsem jich tomu vodnímu mágovi ve mêstê prodal spoustu.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Ale tady jsou pêknê vzácný. Vêtšinu z nich jsem našel severovýchodnê od Khorinidu.

	Info_AddChoice	(DIA_Addon_Erol_what, "Proè se prostê nepoohlédneš po nových?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Proè se prostê nepoohlédneš po nových?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //V té bitce s bandity jsem si vymknul kotník.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Sice mùžu kulhat, ale pêšky s tou nohou moc daleko nedojdu.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Co to bylo za lidi?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Banditi, kdo jinej? Obsadili tady ten most.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Okradou každýho, kdo se ho pokusí pâejít.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Já vêdêl, že tu nêkde šmejdêj, a tak jsem to vzal dolem, pod mostem.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Jenže mùj vùz a všecko to zboží pro nê nejspíš bylo moc velký lákadlo.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ti šmejdi prostê seskoèili z mostu – pâímo na mùj vùz.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Mêl jsem se tam zkusit proplížit v noci.
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_FernandosWeapons		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Erol_FernandosWeapons_Info;

	description	 = 	"Potâebuji informace o dodávce zbraní pro bandity.";
};

func int DIA_Addon_Erol_FernandosWeapons_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
 	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Potâebuju informace o dodávkách zbraní pro bandity.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Dodávky zbraní? Jo, o tom vím. Àáká svinê z mêsta jim prodala tolik zbraní, že je sotva unesou.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Nêkterý maj i na tom mostê, kde mê ti grázlové pâepadli.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Zbytek nejspíš odtahali na náhorní pastviny za Bengarovým statkem.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Možná je ti lotâi chtêli pâevézt pâes prùsmyk.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Kde jsou ty horní pastviny?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Kde jsou ty náhorní pastviny?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //Orlanova hospoda leží zhruba uprostâed ostrova Khorinis. Jmenuje se U Mrtvé harpyje.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Odtud vede cesta k jihu a ústí právê na náhorní pastviny u vchodu do prùsmyku k Hornickýmu údolí.
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};


///////////////////////////////////////////////////////////////////////
//	Info Stoneplates
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Stoneplates		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Stoneplates_Condition;
	information	 = 	DIA_Addon_Erol_Stoneplates_Info;
	permanent	 = 	TRUE;

	description	 = 	"K têm kamenným tabulkám...";
};

func int DIA_Addon_Erol_Stoneplates_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = (Value_StonePlateCommon + 5); //Joly:Kohle für eine StonePlateCommon

func void DIA_Addon_Erol_Stoneplates_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Co se týèe têch kamenných tabulek...

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Jednu tady mám.
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //Pár jich tu mám.
		
					if ((StoneplatesCount + StoneplatesCounter) >= 3)
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 3 - StoneplatesCounter);
						XP_Addon_BringStoneplates = ((3 - StoneplatesCounter) * XP_Addon_BringStoneplate);
						StoneplatesCounter = 3;
					}
					else
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, StoneplatesCount);
						XP_Addon_BringStoneplates = (StoneplatesCount * XP_Addon_BringStoneplate);
						StoneplatesCounter = (StoneplatesCounter + StoneplatesCount); 
					};
					B_GivePlayerXP (XP_Addon_BringStoneplates);
				};
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Dêkuju.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Ještê poâád mi chybí dvê.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Teë už mi schází jenom jedna.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //To staèí. Teë mùžu dodržet slovo, odnést je do mêsta a pak se koneènê vrátit domù.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Samozâejmê ti za nê zaplatím.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Teë už mùžu jít domù. Mùžeš jít se mnou, jestli chceš.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Až tam dojdem, moh bych ti pár vêcí prodat, když budeš chtít.
				
				AI_StopProcessInfos (self);
				AI_UseMob			(self,"BENCH",-1);
				AI_GotoWP 			(self,"NW_TAVERN_TO_FOREST_03");
				Npc_ExchangeRoutine	(self,"Zaèít");
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
	}
	else
	{
			if (C_ScHasMagicStonePlate () == TRUE)
			{
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //A co tahle?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //Ne, tahle kamenná tabulka je magicky nabitá.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //A vodní mágové bohužel tyhle tabulky nevykupujou.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Kolik jich bylo?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Abych si zachránil povêst u vodních mágù ve mêstê, potâebuju tâi tabulky.
			}; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Buerger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Buerger		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Buerger_Condition;
	information	 = 	DIA_Addon_Erol_Buerger_Info;

	description	 = 	"Ty jsi obèanem mêsta?";
};

func int DIA_Addon_Erol_Buerger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_Buerger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Ty jsi obèanem mêsta?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Už jsem tam nebyl jak dlouho, hochu. Ale po têch šmejdech z horní khorinidský ètvrti se mi teda ani trochu nestejská.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Kdysi jsem tam sice nêjakej vliv mêl, ale to už je pár mêsícù.
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTeach		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_PreTeach_Condition;
	information	 = 	DIA_Addon_Erol_PreTeach_Info;

	description	 = 	"Tys dokázal zahnat bandity?";
};

func int DIA_Addon_Erol_PreTeach_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Tys ty bandity zahnal?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Jo, ale urèitê ještê zùstali na mostê.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Mùžeš mê nauèit dávat taky takové rány?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Samozâejmê že mùžu.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic (Topic_OutTeacher,LOG_NOTE);
	B_LogEntry (Topic_OutTeacher, LogText_Addon_Erol_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTrade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_PreTrade_Condition;
	information	 = 	DIA_Addon_Erol_PreTrade_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ukaž mi své zboží.";
};

func int DIA_Addon_Erol_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")>2000)
	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_PreTrade_Info ()
{
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Nic ti prodat nemùžu – všecko zboží mám tamhle pod mostem, hochu.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Prodat ti nêco mùžu, teprve až se dostanu domù.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Ale nemùžu odsud odejít, dokud nebudu mít svý kamenný tabulky.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_SLD		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_SLD_Condition;
	information	 = 	DIA_Addon_Erol_SLD_Info;

	description	 = 	"Tohle je TVOJE chatrè?";
};

func int DIA_Addon_Erol_SLD_Condition ()
{
	if	((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<2000) )
		{
			return TRUE;
		};
};
var int Erol_IsAtHome;
func void DIA_Addon_Erol_SLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(pâekvapenê) Tohle je TVOJE chatrè?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Ano, proè? Co je s ní?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Nemáš problémy se žoldáky?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Když se jim nepletu do âemesla, tak mê taky nechávaj na pokoji.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //Krom toho jsou dobâí zákazníci, a když jim zaplatím, dohlížej mi tu na barák, dokud se nevrátím.
	B_GivePlayerXP (XP_Ambient);
	if (Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine	(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Trade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_Trade_Condition;
	information	 = 	DIA_Addon_Erol_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Ukaž mi své zboží.";
};

func int DIA_Addon_Erol_Trade_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<3000) )
	{
		return TRUE;
	};
};
var int DIA_Addon_Erol_Trade_OneTime;
func void DIA_Addon_Erol_Trade_Info ()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Obávám se, že moc velkej výbêr nemám.
	
	if (Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
		B_LogEntry (Topic_OutTrader, LogText_Addon_ErolTrade);

		Npc_ExchangeRoutine	(self,"Home");
		Erol_IsAtHome = TRUE;
	};
};

//*******************************************
//	TeachPlayer
//*******************************************

INSTANCE DIA_Addon_Erol_Teach(C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 99;
	condition	= DIA_Addon_Erol_Teach_Condition;
	information	= DIA_Addon_Erol_Teach_Info;
	permanent	= TRUE;
	description = "Ukaž mi, jak nepâátelùm zasazovat vêtší rány.";
};                       

FUNC INT DIA_Addon_Erol_Teach_Condition()
{
	if (Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Erol_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Ukaž mi, jak dávat vêtší rány.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Dobâe, ale nebude to zadarmo.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Pomoz mi zachránit povêst a pâines mi mý ztracený kamenný tabulky.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Pak ti ukážu, jak v boji co nejlíp využívat vlastní síly.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Dobâe, tak dávej pozor. Ukážu ti jeden trik.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Když nêkomu dáváš ránu, nedêlej to jen silou paže, ale vlož do toho sílu celýho têla.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Pootoè têlem, vystrè rameno dopâedu a zároveà švihni paží.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(smêje se) Když se dobâe strefíš, poznáš ten rozdíl.
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Jestli se chceš nauèit víc, budeš muset tvrdê trénovat.
		Info_ClearChoices (DIA_Addon_Erol_Teach);
		Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
	};
};

FUNC VOID DIA_Addon_Erol_Teach_Back ()
{
	Info_ClearChoices (DIA_Addon_Erol_Teach);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};







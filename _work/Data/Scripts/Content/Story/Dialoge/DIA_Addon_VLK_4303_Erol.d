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

	description	 = 	"Co se dìje?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Co se dìje?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(naštvanì) Co se dìje? Jen se koukni na ten binec tady pod tím mostem.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(naštvanì) Nìco takovýho jsem v životì nevidìl. Ty svinì by mìl nìkdo zlikvidovat, to ti povím.
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
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Byl jsem se svejma pomocníkama zrovna na cestì, když mi zèistajasna na vùz skoèily tyhle hnusný bestie a každýho zabily.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Mám kliku, že jsem ještì nezapomnìl pravej hák, jinak by bylo taky po mnì.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Obchodník Erol se stal obìtí banditù, kteøí se utáboøili u mostu poblíž hospody U Mrtvé harpyje. Sebrali mu všechno jeho zboží, vèetnì jakýchsi cenných kamenných desek. Erol by byl velmi rád, kdybych mu je pøinesl zpìt."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Tady ty vìci jsou tvoje?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kdo byli ti lidé?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Ty vìci pod mostem jsou tvoje?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Vùz, zboží, všecko.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Koukni, nìjaké vìci jsem ti našel.
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Mùžeš si je nechat. Teï už pro mì vìci žádnou cenu nemají.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Ale pro mì už žádnou cenu nemá vlastnì nic.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Jediná nenahraditelná vìc, kterou mi sebrali, jsou tøi kamenný tabulky.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kamenné tabulky?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Kamenné tabulky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Slíbil jsem jednomu vodnímu mágovi z mìsta, že mu je pøinesu – chtìl je ode mì koupit.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Musím je získat zpátky za každou cenu, jinak bude moje povìst v tahu.

	Info_AddChoice	(DIA_Addon_Erol_what, "Kde jsi získal ty kamenné tabulky?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Co s nimi mágové vody chtìjí dìlat?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Co s nimi chce dìlat?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Prý je chce studovat, a tak mì požádal, abych mu pøinesl ještì další.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Kde jsi našel ty kamenné tabulky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Bejvaji u starejch budov, jako jsou mauzolea. A obèas taky v jeskyních.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Už jsem jich tomu vodnímu mágovi ve mìstì prodal spoustu.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Ale tady jsou pìknì vzácný. Vìtšinu z nich jsem našel severovýchodnì od Khorinidu.

	Info_AddChoice	(DIA_Addon_Erol_what, "Proè se prostì nepoohlédneš po nových?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Proè se prostì nepoohlédneš po nových?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //V té bitce s bandity jsem si vymknul kotník.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Sice mùžu kulhat, ale pìšky s tou nohou moc daleko nedojdu.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Co to bylo za lidi?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Banditi, kdo jinej? Obsadili tady ten most.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Okradou každýho, kdo se ho pokusí pøejít.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Já vìdìl, že tu nìkde šmejdìj, a tak jsem to vzal dolem, pod mostem.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Jenže mùj vùz a všecko to zboží pro nì nejspíš bylo moc velký lákadlo.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ti šmejdi prostì seskoèili z mostu – pøímo na mùj vùz.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Mìl jsem se tam zkusit proplížit v noci.
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

	description	 = 	"Potøebuji informace o dodávce zbraní pro bandity.";
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
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Potøebuju informace o dodávkách zbraní pro bandity.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Dodávky zbraní? Jo, o tom vím. Òáká svinì z mìsta jim prodala tolik zbraní, že je sotva unesou.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Nìkterý maj i na tom mostì, kde mì ti grázlové pøepadli.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Zbytek nejspíš odtahali na náhorní pastviny za Bengarovým statkem.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Možná je ti lotøi chtìli pøevézt pøes prùsmyk.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Kde jsou ty horní pastviny?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Kde jsou ty náhorní pastviny?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //Orlanova hospoda leží zhruba uprostøed ostrova Khorinis. Jmenuje se U Mrtvé harpyje.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Odtud vede cesta k jihu a ústí právì na náhorní pastviny u vchodu do prùsmyku k Hornickýmu údolí.
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

	description	 = 	"K tìm kamenným tabulkám...";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Co se týèe tìch kamenných tabulek...

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
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Dìkuju.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Ještì poøád mi chybí dvì.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Teï už mi schází jenom jedna.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //To staèí. Teï mùžu dodržet slovo, odnést je do mìsta a pak se koneènì vrátit domù.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Samozøejmì ti za nì zaplatím.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Teï už mùžu jít domù. Mùžeš jít se mnou, jestli chceš.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Až tam dojdem, moh bych ti pár vìcí prodat, když budeš chtít.
				
				AI_StopProcessInfos (self);
				AI_UseMob			(self,"BENCH",-1);
				AI_GotoWP 			(self,"NW_TAVERN_TO_FOREST_03");
				Npc_ExchangeRoutine	(self,"Start");
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
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Abych si zachránil povìst u vodních mágù ve mìstì, potøebuju tøi tabulky.
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

	description	 = 	"Ty jsi obèanem mìsta?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Ty jsi obèanem mìsta?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Už jsem tam nebyl jak dlouho, hochu. Ale po tìch šmejdech z horní khorinidský ètvrti se mi teda ani trochu nestejská.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Kdysi jsem tam sice nìjakej vliv mìl, ale to už je pár mìsícù.
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Jo, ale urèitì ještì zùstali na mostì.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Mùžeš mì nauèit dávat taky takové rány?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Samozøejmì že mùžu.
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Prodat ti nìco mùžu, teprve až se dostanu domù.

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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(pøekvapenì) Tohle je TVOJE chatrè?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Ano, proè? Co je s ní?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Nemáš problémy se žoldáky?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Když se jim nepletu do øemesla, tak mì taky nechávaj na pokoji.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //Krom toho jsou dobøí zákazníci, a když jim zaplatím, dohlížej mi tu na barák, dokud se nevrátím.
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
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Obávám se, že moc velkej výbìr nemám.
	
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
	description = "Ukaž mi, jak nepøátelùm zasazovat vìtší rány.";
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
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Ukaž mi, jak dávat vìtší rány.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Dobøe, ale nebude to zadarmo.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Pomoz mi zachránit povìst a pøines mi mý ztracený kamenný tabulky.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Pak ti ukážu, jak v boji co nejlíp využívat vlastní síly.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Dobøe, tak dávej pozor. Ukážu ti jeden trik.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Když nìkomu dáváš ránu, nedìlej to jen silou paže, ale vlož do toho sílu celýho tìla.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Pootoè tìlem, vystrè rameno dopøedu a zároveò švihni paží.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(smìje se) Když se dobøe strefíš, poznáš ten rozdíl.
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Jestli se chceš nauèit víc, budeš muset tvrdì trénovat.
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







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

	description	 = 	"Co se dęje?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Co se dęje?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(naštvanę) Co se dęje? Jen se koukni na ten binec tady pod tím mostem.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(naštvanę) Nęco takovýho jsem v životę nevidęl. Ty svinę by męl nękdo zlikvidovat, to ti povím.
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
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Byl jsem se svejma pomocníkama zrovna na cestę, když mi zčistajasna na vůz skočily tyhle hnusný bestie a každýho zabily.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Mám kliku, že jsem ještę nezapomnęl pravej hák, jinak by bylo taky po mnę.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Obchodník Erol se stal obętí banditů, kteâí se utáboâili u mostu poblíž hospody U Mrtvé harpyje. Sebrali mu všechno jeho zboží, včetnę jakýchsi cenných kamenných desek. Erol by byl velmi rád, kdybych mu je pâinesl zpęt."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Tady ty vęci jsou tvoje?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kdo byli ti lidé?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Ty vęci pod mostem jsou tvoje?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Vůz, zboží, všecko.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Koukni, nęjaké vęci jsem ti našel.
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Můžeš si je nechat. Teë už pro mę vęci žádnou cenu nemají.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Ale pro mę už žádnou cenu nemá vlastnę nic.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Jediná nenahraditelná vęc, kterou mi sebrali, jsou tâi kamenný tabulky.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kamenné tabulky?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Kamenné tabulky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Slíbil jsem jednomu vodnímu mágovi z męsta, že mu je pâinesu – chtęl je ode mę koupit.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Musím je získat zpátky za každou cenu, jinak bude moje povęst v tahu.

	Info_AddChoice	(DIA_Addon_Erol_what, "Kde jsi získal ty kamenné tabulky?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Co s nimi mágové vody chtęjí dęlat?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Co s nimi chce dęlat?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Prý je chce studovat, a tak mę požádal, abych mu pâinesl ještę další.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Kde jsi našel ty kamenné tabulky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Bejvaji u starejch budov, jako jsou mauzolea. A občas taky v jeskyních.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Už jsem jich tomu vodnímu mágovi ve męstę prodal spoustu.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Ale tady jsou pęknę vzácný. Vętšinu z nich jsem našel severovýchodnę od Khorinidu.

	Info_AddChoice	(DIA_Addon_Erol_what, "Proč se prostę nepoohlédneš po nových?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Proč se prostę nepoohlédneš po nových?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //V té bitce s bandity jsem si vymknul kotník.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Sice můžu kulhat, ale pęšky s tou nohou moc daleko nedojdu.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Co to bylo za lidi?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Banditi, kdo jinej? Obsadili tady ten most.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Okradou každýho, kdo se ho pokusí pâejít.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Já vędęl, že tu nękde šmejdęj, a tak jsem to vzal dolem, pod mostem.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Jenže můj vůz a všecko to zboží pro nę nejspíš bylo moc velký lákadlo.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ti šmejdi prostę seskočili z mostu – pâímo na můj vůz.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Męl jsem se tam zkusit proplížit v noci.
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
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Dodávky zbraní? Jo, o tom vím. Ŕáká svinę z męsta jim prodala tolik zbraní, že je sotva unesou.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Nękterý maj i na tom mostę, kde mę ti grázlové pâepadli.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Zbytek nejspíš odtahali na náhorní pastviny za Bengarovým statkem.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Možná je ti lotâi chtęli pâevézt pâes průsmyk.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Kde jsou ty horní pastviny?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Kde jsou ty náhorní pastviny?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //Orlanova hospoda leží zhruba uprostâed ostrova Khorinis. Jmenuje se U Mrtvé harpyje.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Odtud vede cesta k jihu a ústí právę na náhorní pastviny u vchodu do průsmyku k Hornickýmu údolí.
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

	description	 = 	"K tęm kamenným tabulkám...";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Co se týče tęch kamenných tabulek...

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
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Dękuju.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Ještę poâád mi chybí dvę.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Teë už mi schází jenom jedna.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //To stačí. Teë můžu dodržet slovo, odnést je do męsta a pak se konečnę vrátit domů.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Samozâejmę ti za nę zaplatím.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Teë už můžu jít domů. Můžeš jít se mnou, jestli chceš.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Až tam dojdem, moh bych ti pár vęcí prodat, když budeš chtít.
				
				AI_StopProcessInfos (self);
				AI_UseMob			(self,"BENCH",-1);
				AI_GotoWP 			(self,"NW_TAVERN_TO_FOREST_03");
				Npc_ExchangeRoutine	(self,"Začít");
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
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Abych si zachránil povęst u vodních mágů ve męstę, potâebuju tâi tabulky.
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

	description	 = 	"Ty jsi občanem męsta?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Ty jsi občanem męsta?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Už jsem tam nebyl jak dlouho, hochu. Ale po tęch šmejdech z horní khorinidský čtvrti se mi teda ani trochu nestejská.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Kdysi jsem tam sice nęjakej vliv męl, ale to už je pár męsíců.
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Jo, ale určitę ještę zůstali na mostę.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Můžeš mę naučit dávat taky takové rány?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Samozâejmę že můžu.
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Nic ti prodat nemůžu – všecko zboží mám tamhle pod mostem, hochu.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Prodat ti nęco můžu, teprve až se dostanu domů.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Ale nemůžu odsud odejít, dokud nebudu mít svý kamenný tabulky.
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

	description	 = 	"Tohle je TVOJE chatrč?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(pâekvapenę) Tohle je TVOJE chatrč?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Ano, proč? Co je s ní?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Nemáš problémy se žoldáky?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Když se jim nepletu do âemesla, tak mę taky nechávaj na pokoji.
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
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Obávám se, že moc velkej výbęr nemám.
	
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
	description = "Ukaž mi, jak nepâátelům zasazovat vętší rány.";
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
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Ukaž mi, jak dávat vętší rány.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Dobâe, ale nebude to zadarmo.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Pomoz mi zachránit povęst a pâines mi mý ztracený kamenný tabulky.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Pak ti ukážu, jak v boji co nejlíp využívat vlastní síly.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Dobâe, tak dávej pozor. Ukážu ti jeden trik.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Když nękomu dáváš ránu, nedęlej to jen silou paže, ale vlož do toho sílu celýho tęla.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Pootoč tęlem, vystrč rameno dopâedu a zároveŕ švihni paží.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(smęje se) Když se dobâe strefíš, poznáš ten rozdíl.
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Jestli se chceš naučit víc, budeš muset tvrdę trénovat.
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







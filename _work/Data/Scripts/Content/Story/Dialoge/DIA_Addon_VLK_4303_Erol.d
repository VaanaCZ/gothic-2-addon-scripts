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

	description	 = 	"Qual è il problema???";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Qual è il problema?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(arrabbiato) Qual è il problema?! Guarda che confusione c'è sotto il ponte.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(arrabbiato) Non ho mai visto niente di simile in tutta la mia vita. Quei porci andrebbero sterminati, ti dico.
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

	description	 = 	"Cosa è successo?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Cosa è successo?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Ero in viaggio con i miei aiutanti quando quegli orribili bruti si sono avventati sul mio carro e hanno massacrato tutti quanti.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Fortunatamente ho ancora un gancio potente, altrimenti avrebbero ucciso anche me.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Il commerciante Erol è stato attaccato da diversi briganti. Gli hanno rubato tutto. I briganti sul ponte vicino alla taverna dell''Arpia Morta' hanno ancora le sue preziose tavolette di pietra ed Erol le rivuole."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Quella roba sotto il ponte è tua?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Chi erano quelle persone?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Quella roba sotto il ponte è tua?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Il carro, le merci, tutto.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Guarda, ho recuperato parte della tua roba...
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Puoi tenertela. Per me non ha nessun valore.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Ma per me non ha nessun valore.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //L'unica cosa davvero insostituibile sono le tre tavolette di pietra che mi hanno rubato.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Tavolette di pietra?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Tavolette di pietra?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Me le ha chieste il Mago dell'Acqua in città, e io ho promesso di procurargliele.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Devo assolutamente riaverle, altrimenti la mia reputazione ne soffrirà.

	Info_AddChoice	(DIA_Addon_Erol_what, "Dove hai preso quelle tavolette di pietra?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Cosa se ne fa un Mago dell'Acqua?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Cosa se ne fa un Mago dell'Acqua?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Ha detto che voleva studiarle e me ne ha chieste delle altre.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Dove hai preso quelle tavolette di pietra?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Le ho trovate vicino a edifici antichi, come mausolei, o a volte nelle grotte.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Ne ho già vendute parecchie ai Maghi dell'Acqua, in città.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Ma qui sono piuttosto rare. La maggior parte le ho trovate a nord-est di Khorinis.

	Info_AddChoice	(DIA_Addon_Erol_what, "Perché non vai a cercarne delle altre?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Perché non vai a cercarne delle altre?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Combattendo con i banditi mi sono storto la caviglia.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Zoppico, e non posso fare molta strada col piede in queste condizioni.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Chi erano quelle persone?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Briganti, chi altri? Hanno preso il controllo del ponte.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Rapinano chiunque cerchi di attraversare il ponte.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Sapevo che erano appostati lassù, così sono passato sotto il ponte.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Ma la mia roba dev'essere stata una tentazione troppo forte per loro.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Quei manigoldi sono saltati giù dal ponte, dritti sopra il mio carro.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Avrei dovuto provarci di notte...
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

	description	 = 	"Ho bisogno di informazioni su una consegna di armi ai briganti.";
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
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Ho bisogno di informazioni su una consegna di armi ai briganti.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Una consegna di armi? Sì, so di cosa parli. Qualche porco ha venduto loro talmente tante armi che quasi non riuscivano a portarle.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Alcune le tengono sul ponte dove mi hanno attaccato, quei bastardi.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Il resto sarà stato trasportato oltre la fattoria di Bengar, sui pascoli alti.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Forse i briganti volevano portarle oltre il passo.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Dove sono i pascoli alti?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Dove sono i pascoli alti?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //La taverna di Orlan si trova grosso modo al centro dell'isola di Khorinis. Si chiama 'L'Arpia Morta'.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Da lì parte una strada che va verso sud. Porta ai pascoli alti e all'ingresso del passo che conduce nella Valle delle Miniere.
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

	description	 = 	"A proposito delle tavolette di pietra…";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Quelle tavolette di pietra...

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Ne ho una qui.
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //Ne ho alcune.
		
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
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Grazie.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Ora me ne mancano due.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Ora me ne manca solo una.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //È sufficiente. Ora manterrò la promessa fatta al Mago dell'Acqua, e poi me ne tornerò finalmente a casa.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Ovviamente te le pagherò.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Sto andando a casa. Puoi venire con me, se ti va.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Magari, una volta arrivati, potrò venderti qualcosa di interessante.
				
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
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //Che mi dici di questa, allora?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //No. Questo tipo di tavoletta ha una carica magica.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //Il Mago dell'Acqua non compra tavolette di questo tipo.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Quante ce n'erano?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Per salvare la mia reputazione con il Mago mi servono 3 tavolette.
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

	description	 = 	"Sei un cittadino di qui?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Sei un cittadino di qui?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Non lo sono da tempo, ragazzo. Non sono in buoni rapporti con quei porci corrotti dei quartieri alti di Khorinis.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Un tempo ero una persona piuttosto influente lì, sai. Ma è stato mesi fa.
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

	description	 = 	"Sei riuscito a respingere i briganti?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Sei riuscito a respingere i briganti?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Sì. Ma sono sicuro che sono ancora lì sul ponte.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Puoi insegnarmi a colpire così forte?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Certo che posso.
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

	description	 = 	"Mostrami la mercanzia.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Non posso venderti altro. Tutta la mia mercanzia è laggiù, sotto il ponte.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Potrò venderti qualcosa solo tornato a casa.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Ma non me ne andrò finché non avrò ripreso le mie tavolette.
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

	description	 = 	"Questa è la TUA capanna?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(sorpreso) È QUESTA la tua capanna?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Sì. Perché? C'è qualcosa che non va?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Non hai nessun problema con i mercenari?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Finché non interferisco con le loro faccende, mi lasciano in pace.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //E poi sono buoni clienti, e li pago perché tengano d'occhio la mia casa quando sono via.
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
	description	 = 	"Mostrami la mercanzia.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Temo che non ci sia molto da scegliere.
	
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
	description = "Insegnami a colpire più forte.";
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
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Insegnami a colpire più forte.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //D'accordo, ma devi farmi un favore.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Aiutami a salvare la mia reputazione e riportami le mie tavolette.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //In cambio, ti mostrerò come utilizzare meglio la tua forza in combattimento.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Bene. Fai attenzione. Il trucco è semplice.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Quando colpisci, non usare solo la forza del braccio, ma sfrutta quella di tutto il corpo.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Ruota il fianco, porta in avanti la spalla e allunga il braccio per l'affondo.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(ride) Se colpisci bene, noterai la differenza!
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Se vuoi imparare dell'altro, dovrai esercitarti molto...
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







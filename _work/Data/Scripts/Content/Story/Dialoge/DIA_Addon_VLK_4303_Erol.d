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

	description	 = 	"¿¿Qué pasa??";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //¿Qué ocurre?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(enfadado) ¿Qué ocurre? Mira qué desastre bajo ese puente de allí.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(enfadado) No he visto nada igual en toda mi vida. Habría que exterminar a esos cerdos, te lo digo.
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

	description	 = 	"¿Qué ha pasado?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //¿Qué ha pasado?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Pasaba por aquí con mis ayudantes cuando  aparecieron esas bestias de la nada, saltaron a mi carro y masacraron a todo el mundo.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Suerte que tengo un buen derechazo o me hubieran matado a mí también.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Unos bandidos atacaron al comerciante Erol. Le robaron todos sus bienes. Los bandidos del puente, junto a la taberna 'La arpía muerta' conservan sus valiosas tablillas. Erol quiere recuperarlas."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "¿Todo eso de debajo del puente es tuyo?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "¿Quiénes eran ésos?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //¿Todo eso de debajo del puente es tuyo?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //El carro, la mercancía, todo.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Mira, te he recogido algunas cosas
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Puedes quedártelo. Nada de eso tiene mucho valor para mí.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Pero nada de eso tiene mucho valor para mí.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Lo único que es irreemplazable son las tres tablillas de piedra que me han quitado.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "¿Tablillas de piedra?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //¿Tablillas de piedra?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //El Mago de Agua de la ciudad quiere comprármelas y yo le prometí que se las conseguiría.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Debo recuperarlas a toda costa o mi reputación quedará manchada.

	Info_AddChoice	(DIA_Addon_Erol_what, "¿Dónde conseguiste esas tablillas de piedra?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "¿Para qué las querrá un Mago de Agua?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //¿Para qué las querrá un Mago de Agua?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Dijo que iba a estudiarlas y me pidió que le llevara más.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //¿Dónde conseguiste esas tablillas de piedra?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Las he encontrado cerca de construcciones antiguas, como mausoleos, o incluso cuevas.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Ya le he vendido un montón al Mago de Agua de la ciudad.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Pero por aquí no son muy comunes. Yo he encontrado casi todas al noreste de Khorinis.

	Info_AddChoice	(DIA_Addon_Erol_what, "¿Y por qué no vas a buscar otras?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //¿Y por qué no vas a buscar otras?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Me hice un esguince en el tobillo durante la pelea con los bandidos.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Puedo ir cojeando, pero no quiero andar mucho con el pie así.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //¿Quiénes eran esos tipos?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Bandidos. ¿Quién si no? Han tomado el puente de ahí arriba.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Roban a todo el que intenta cruzarlo.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Sabía que andaban por aquí, por eso fui por debajo del puente.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Pero les habrán parecido muy tentadores mi carro y mis bienes .
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Esos granujas saltaron sin más desde el puente, directamente a mi carro.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Tendría que haber intentado pasar de noche.
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

	description	 = 	"Necesito información sobre un envío de armas para los bandidos.";
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
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Necesito información sobre un envío de armas para los bandidos.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //¿Envío de armas? Sí, ya sé qué dices. Algún malnacido de la ciudad les vendió tantas armas que casi no podían ni llevarlas.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Algunas las tienen en el puente donde esos bastardos me atacaron.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //El resto se las llevarían a los altos pastos, más allá de la granja de Bengar.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Tan vez los bandidos querían llevarlas más allá del paso.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "¿Dónde están esos altos pastos?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //¿Dónde están esos altos pastos?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //La taberna de Orlan está más o menos en el centro de la isla de Khorinis. Se llama 'La arpía feliz'.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Al sur de allí hay un camino que lleva a los altos pastos y a la entrada al paso del Valle de Minas.
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

	description	 = 	"Sobre las tablillas de piedra…";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Sobre esas tablillas de piedra

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Tengo una aquí.
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //Tengo unas cuantas.
		
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
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Gracias.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Aún me faltan dos.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Ya sólo me falta una.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //Ya está. Ahora podré cumplir la promesa que le hice al Mago de Agua de la ciudad e irme por fin a casa.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Te pagaré por ellas, claro está.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Ahora me voy a casa. Si quieres, puedes acompañarme.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Quizá allí pueda venderte cosas que te interesen.
				
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
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //¿Y qué te parece esta?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //No. Esta clase de tablilla de piedra tiene carga mágica.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //Es una pena, el Mago de Agua no compra estas tablillas.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //¿Cuántas había?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Necesito 3 tablillas para salvar mi reputación con el Mago de Agua en la ciudad.
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

	description	 = 	"¿Eres de la ciudad?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //¿Eres de la ciudad?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Hace años que no soy ciudadano, amigo. Esos bastardos corruptos del barrio alto de Khorinis y yo no nos tenemos mucho aprecio.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Antes tenía bastante influencia en la zona, ya sabes. Pero eso era hace meses.
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

	description	 = 	"¿Has conseguido alejar a los bandidos?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //¿Has conseguido alejar a los bandidos?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Sí, pero seguro que siguen por el puente.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //¿Puedes enseñarme a golpear así?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Pues claro que sí.
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

	description	 = 	"Enséñame tu mercancía.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //No te puedo vender nada. Todo lo que tenía está ahí, bajo el puente.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Sólo podré venderte algo cuando vuelva a casa.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Pero no me moveré de aquí hasta recuperar mis tablillas de piedra.
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

	description	 = 	"¿Esta es TU cabaña?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(sorprendido) ¿Esta de aquí es TU cabaña?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Sí, ¿por qué? ¿Tiene algo de malo?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //¿No tienes problemas con los mercenarios?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Mientras yo no interfiera en sus negocios, ellos también me dejan en paz.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //Además, son incluso buenos clientes y les pago por vigilarme la casa cuando yo no estoy.
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
	description	 = 	"Enséñame tu mercancía.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Tampoco es que haya mucha alternativa.
	
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
	description = "Enséñame a dar golpes más fuertes.";
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
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Enséñame a dar golpes más fuertes.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Muy bien, pero estarás en deuda conmigo.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Ayúdame a salvar mi reputación y recuperar mis tablillas de piedra.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Si lo haces, te enseñaré a aprovechar mejor tu fuerza en combate.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Bien. Atento. Hay un truco muy sencillo.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Cuando golpees, no lo hagas con la fuerza de tu brazo, sino con la de todo el cuerpo.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Gira la cadera, adelanta los hombros y lanza el brazo a la vez.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(ríe) ¡Si golpeas como es debido, notarás la diferencia!
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Si quieres aprender más, tendrás que entrenar duro
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







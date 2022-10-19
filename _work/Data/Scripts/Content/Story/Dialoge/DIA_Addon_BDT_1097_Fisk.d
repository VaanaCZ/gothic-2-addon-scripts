//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_EXIT   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 999;
	condition   = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fisk_PICKPOCKET (C_INFO)
{
	npc			= BDT_1097_Addon_Fisk;
	nr			= 900;
	condition	= DIA_Addon_Fisk_PICKPOCKET_Condition;
	information	= DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       
FUNC INT DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	C_Beklauen (118, 300);
};
 
FUNC VOID DIA_Addon_Fisk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
	
func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Hi   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 1;
	condition   = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fisk_Hi_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Eh, si est�s buscando un comerciante decente en el campamento, acabas de encontrarlo.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//Mi caba�a est� justo detr�s de Esteban. Si necesitas algo, p�sate.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk tiene todo tipo de mercanc�as.");
	
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine  (self,"START");
};
//--------------------------------------------------------------------
//	Info Trade
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Trade   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 888;
	condition   = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;

};
FUNC INT DIA_Addon_Fisk_Trade_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Trade_Info()
{
	B_Say (other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	
	//Bolzen nachf�llen
	if (Npc_HasItems (self, ItRw_Bolt) < 50)
	{
		CreateInvItems (self,ItRw_Bolt, (50 - Npc_HasItems (self, ItRw_Bolt))); 
	};
	//Pfeile nachf�llen
	if (Npc_HasItems (self, ItRw_Arrow) < 50)
	{
		CreateInvItems (self,ItRw_Arrow, (50 - Npc_HasItems (self, ItRw_Arrow))); 
	};
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Attentat   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fisk_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //�Mira, yo no quiero tener nada que ver con todo esto!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //(inocentemente) Tengo mis propios problemas, yo mismo soy una v�ctima.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //�En qu� sentido?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //Pagu� una gran cantidad de oro por mi �ltimo env�o.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //�Pero nunca lleg�! Unos rateros se lo llevaron.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //(rabioso) Me han robado, �y probablemente gente de los nuestros!
};

//---------------------------------------------------------------------
//	Lieferung
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Lieferung   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 3;
	condition   = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent   = FALSE;
	description	= "�Qu� tipo de env�o era?";
};
FUNC INT DIA_Addon_Fisk_Lieferung_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //�Qu� tipo de env�o era?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Un paquete de ganz�as. Ten�an que conseguirlas de los piratas para m�.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Pero un tipo llamado Juan me las quit�. (enfadado) �Y todo el oro que pagu� por ellas!
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Ese mal nacido se esconde en alg�n lugar del pantano.
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Un tipo llamado Juan negociaba con los bandidos. Dicen que se esconde en alg�n lugar de la ci�naga. ");
	B_LogEntry (Topic_Addon_Fisk,"Un tipo llamado Juan le rob� un env�o a Fisk (un paquete de ganz�as). Se esconde en alg�n lugar de la ci�naga.");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Est� muerto.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //�Bien, as� no me causar� m�s problemas!
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //A�n sigue vivi
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //�Le has dejado escapar con vida?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //No estaba solo
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Tranquilo, yo me ocupar� de esos cabronazos
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //En lo que a ti respecta
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Tengo una relaci�n bastante buena con Huno.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Me ocupar� de que consigas armaduras baratas en adelante.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //Y toma, esta piedra la consegu� de Corristo.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //Es lo �nico que sobrevivi� de mi hu�da de la Barrera. Creo que t� sabr�s sacarle m�s partido que yo.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //Adem�s, te doy una de mis armas.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h gr��er oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //(con malicia) Lo que haga una mano, que no lo vea la otra, eso no ha cambiado.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "Tengo tu paquete.";
};
FUNC INT DIA_Addon_Fisk_GivePaket_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Lennar_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //Tengo tu paquete.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //(satisfecho) �En serio! (con recelo) �Y Juan?
	
	B_Addon_Fisk_AboutJuan();
	
	B_Addon_Fisk_Belohnung();
};

//---------------------------------------------------------------------
//	Paket OPEN - 
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_PaketOpen (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 5;
	condition   = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent   = FALSE;
	description = "�He abierto tu paquete!";
};
FUNC INT DIA_Addon_Fisk_PaketOpen_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (LennarPaket_Open == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //�He abierto tu paquete!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //(r�e) �Claro! No pod�as esperar, �verdad?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //�Al menos tienes a�n las ganz�as?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //Y lo que es m�s importante, �qu� pasa con Juan?

	B_Addon_Fisk_AboutJuan();
};

//---------------------------------------------------------------------
//	- Dietriche abgeben! 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePicks (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 6;
	condition   = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent   = TRUE;
	description = "Aqu� tienes una docena de ganz�as�";
};
FUNC INT DIA_Addon_Fisk_GivePicks_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_PaketOpen))
	&& (MIS_Lennar_Lockpick == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Toma, una docena de ganz�as

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Muy bien. Ya hay gente esperando nueva mercanc�a.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //�Esto no es una docena! (con astucia) No intentar�s enga�arme, �verdad?
	};
};


//---------------------------------------------------------------------
//	Inspektor
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Inspektor (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 7;
	condition   = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent   = FALSE;
	description = "�Juan trabajaba para Esteban!";
};
FUNC INT DIA_Addon_Fisk_Inspektor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Lieferung))
	&& (Npc_KnowsInfo (other, DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //�Juan trabajaba para Esteban!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //(sorprendido) �Qu�?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //�No juegues conmigo! �Ya lo sab�as!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //(calmadamente) Bien. Tienes raz�n. Pero espero que comprendas por qu� no te lo dije.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //En el campamento, todos saben que trabajas para Esteban.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //No tengo ganas de meterme en l�os s�lo porque quieras una piedra roja.
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"No trabajo para Estaban, la verdad�",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"�No te creo!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"�Ya veo!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //�Comprendo!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //�Bien! Entonces no discutamos m�s. �No quiero que nos oigan!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //�No te creo!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //�Cr�ete lo que quieras! �Pero te lo advierto, si piensas contarle a Esteban alg�n cuento chino sobre m�, ser�s el siguiente!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //En serio, no trabajo para Esteban
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //�Y? No querr�s enga�arme, �verdad?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //Te dar� un buen consejo y m�s vale que lo sigas.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Cuando se trata de Esteban, no conf�es en NADIE, ni siquiera en m�, �de acuerdo?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //Y ahora ya basta. �No ser�a bueno que nos oyeran!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

//--------------------------------------------------------------------
//	Info Meeting
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Meeting   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent   = FALSE;
	description = "As� que T� planeaste el ataque.";
};
FUNC INT DIA_Addon_Fisk_Meeting_Condition()
{	
	if (Npc_GetDistToWP  (self, "BL_INN_UP_06") <= 500)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//As� que T� planeaste el ataque.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//S�. Esteban me estorba para mis negocios.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//No deja entrar en la mina a los bandidos que trabajan para m�. Se est� asegurando de que TODO EL MUNDO trabaje exclusivamente para �l.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//De ese modo, puede embolsarse un porcentaje de cada trato y controla todo el campamento.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"�Qu� piensas hacer ahora?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"�Quieres ocupar su lugar?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Podr�a venderte a Esteban�",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//�Quieres ocupar su lugar?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//No, yo soy comerciante. S�lo quiero hacer negocios en paz.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Podr�a venderte a Esteban
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//�Y? �Qu� crees que pasar�a entonces? �Crees que te dar�a lo que quieres?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Olv�dalo, tengo un plan mejor.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//�Qu� est�s tramando?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Nos quitaremos a Esteban de en medio. En otras palabras, le matas para ocupar SU lugar.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Mientras sus guardaespaldas lo acompa�en, es imposible.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//Entonces tendemos que hacer que se marchen� dici�ndoles la verdad.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//�Qu� verdad?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//Has hecho tu trabajo. Ya sabes que yo fui quien plane� el ataque.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//D�selo a Esteban y enviar� a sus hombres a por m�. Les esperar� aqu�.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//Cuando se vayan, t� te ocupas del bastardo y yo me las ver� con los guardias.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban est� muerto. Puedo volver a dedicarme a mi negocio.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Toma, para ti
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Fisk encarg� el ataque a Esteban.");
};
//--------------------------------------------------------------------
//	Info Sieg
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Sieg   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent   = FALSE;
	description = "Esteban est� acabado.";
};
FUNC INT DIA_Addon_Fisk_Sieg_Condition()
{	
	if (MIS_Judas == LOG_SUCCESS)
	&&  Npc_IsDead (Esteban)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban est� acabado.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//Llevo tiempo esperando esto.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Creo que ahora tienes cosas que hacer y yo tengo que volver a mi trabajo.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Si necesitas algo m�s, ya sabes d�nde encontrarme.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};


///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_EXIT   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 999;
	condition   = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_Hallo   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Girion_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (MIS_ShipIsFree == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Girion_Hallo_Info()
{
	AI_Output (self, other, "DIA_Girion_Hallo_08_00"); //Soy Girion, maestro del combate con armas a dos manos y palad�n del rey. �Por qu� me molestas?
};
///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CanTeach		(C_INFO)
{
	npc			 = 	PAL_207_Girion;
	nr			 = 	5;
	condition	 = 	DIA_Girion_CanTeach_Condition;
	information	 = 	DIA_Girion_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"�Podr�as entrenarme?";
};
func int DIA_Girion_CanTeach_Condition ()
{	
	if (Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Girion_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Girion_CanTeach_15_00"); //�Puedes entrenarme?
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Girion_CanTeach_08_01"); //Haces bien en entrenar en el m�s noble de todos los estilos. Es lo propio para un guerrero de Innos.
		AI_Output (self, other, "DIA_Girion_CanTeach_08_02"); //Te entrenar�. Ven a verme cuando est�s listo.
		
		Girion_Teach2H = TRUE;	
		B_LogEntry (TOPIC_CityTeacher,"Girion, el palad�n, puede ense�arme a luchar con armas a dos manos.");
	}
	else
	{
		AI_Output (self, other, "DIA_Girion_CanTeach_08_03"); //Si quieres aprender algo, tendr�s que buscar un profesor de fuera de nuestra orden.
		AI_Output (self, other, "DIA_Girion_CanTeach_08_04"); //Soy un guerrero, no un profesor.
	};
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Girion_Teach(C_INFO)
{
	npc			= PAL_207_Girion;
	nr			= 100;
	condition	= DIA_Girion_Teach_Condition;
	information	= DIA_Girion_Teach_Info;
	permanent	= TRUE;
	description = "Estoy listo para el entrenamiento.";
};                       
//----------------------------------
var int DIA_Girion_Teach_permanent;
//----------------------------------
FUNC INT DIA_Girion_Teach_Condition()
{
	if (Girion_Teach2H == TRUE)
	&& (DIA_Girion_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
// -------------------------------
var int  girion_merk2h;
// ------------------------------- 
FUNC VOID DIA_Girion_Teach_Info()
{	
	girion_merk2h = other.HitChance[NPC_TALENT_2H];  
	
	AI_Output (other,self ,"DIA_Girion_Teach_15_00"); //Estoy listo para recibir entrenamiento.
	
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);

};
FUNC VOID DIA_Girion_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_00"); //Por supuesto, tu educaci�n no ha terminado, pero no hay nada m�s que yo pueda ense�arte.
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_01"); //Si quieres mejorar m�s a�n tu talento con la espada, deber�s buscar un aut�ntico maestro de armas.
		AI_Output (other,self,"DIA_DIA_Girion_Teach_15_02"); //�D�nde puedo encontrar un hombre as�?
		AI_Output (self,other,"DIA_DIA_Girion_Teach_08_03"); //Lord Hagen es un maestro de armas. Seguro que te adiestra.
		
		DIA_Girion_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Girion_Teach);
};

FUNC VOID DIA_Girion_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_00"); //Lucha con honor. El combate es nuestra vida y, �qu� es tu vida sin honor?
		};
		if (Girion_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_01"); //En el combate s� prudente y r�pido. Sorprende a tu oponente.
		};
		if (Girion_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_02"); //Nunca acudas a un combate sin estar preparado. Nunca se sabe si va a ser el �ltimo.
		};
		if (Girion_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_1_08_03"); //Un palad�n siempre est� preparado para el combate, pero nunca comienza una pelea que no pueda ganar.
		};
		
		Girion_Labercount = Girion_Labercount +1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;	
		};
	};
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);	
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);	
};

FUNC VOID DIA_Girion_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_00"); //Un palad�n no lucha s�lo con la espada, tambi�n con su mente.
		};
		if (Girion_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_01"); //Tienes que saber cu�ndo te puedes retirar.
		};
		if (Girion_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_02"); //Recuerda: luchas bien si controlas a tu oponente y no le das la oportunidad de que mantenga el control.
		};
		if (Girion_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Girion_Teach_2H_5_08_03"); //Solo eres derrotado cuando abandonas.
		};
		
		Girion_Labercount = Girion_Labercount +1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;	
		};
	};
	
	Info_ClearChoices 	(DIA_Girion_Teach);
	Info_AddChoice 		(DIA_Girion_Teach,	DIALOG_BACK		,DIA_Girion_Teach_Back);
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_Teach_2H_1);	
	Info_AddChoice		(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_Teach_2H_5);	
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info CatchPlayerStolenShip
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CATCHPLAYERSTOLENSHIP		(C_INFO)
{
	npc		 = 	PAL_207_Girion;
	nr		 = 	5;
	condition	 = 	DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information	 = 	DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important	 = 	TRUE;
};

func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition ()
{
	if (Kapitel >= 5)
	&& (MIS_ShipIsFree == TRUE) 
	&& (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25")<1000) //Joly: ist nur hier, wenn SC die Wachen �berredet hat, ihm das Schiff zu geben.
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info ()
{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00"); //�Eh! �Puedes decirme lo que haces aqu�?

	Info_ClearChoices	(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "No s� de qu� me hablas.", DIA_Girion_CATCHPLAYERSTOLENSHIP_no );
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Sal de mi camino o tendr� que matarte.", DIA_Girion_CATCHPLAYERSTOLENSHIP_weg );
	Info_AddChoice	(DIA_Girion_CATCHPLAYERSTOLENSHIP, "Necesito un barco.", DIA_Girion_CATCHPLAYERSTOLENSHIP_ship );

};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00"); //No s� de qu� me hablas.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01"); //Hablo de lo que hayas hecho ah� arriba con los guardias del barco. Esto me huele a cuerno quemado.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02"); //Aunque seas mago, sigo sin confiar en ti.
	};
};
var int Girion_WantstoKillSC;
func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00"); //Qu�tate de en medio o tendr� que matarte.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01"); //A lo mejor enga�as a los guardias de la nave pero, amiguito, yo soy un hueso dif�cil de roer.
	if (hero.guild == GIL_PAL)
	{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02"); //Aunque seas uno de los nuestros, eso no te da derecho a robar la propiedad del rey. Muere, maldito traidor.
	};
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09"); //Cuando hayamos acabado con este asunto me devolver�s el barco, �de acuerdo?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship ()
{
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00"); //Necesito el barco, as� que lo coger�.
	
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01"); //No puedes hacerlo. El transporte del mineral...
	}
	else
	{
		AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02"); //C�mo te atreves, asqueroso hijo de...
	};
	
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03"); //El mineral del Valle de las Minas no basta para satisfacer al rey. Yo estuve all� y ya no queda nada. La misi�n de Hagen es una farsa.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04"); //La amenaza real est� en una isla no lejos de aqu�. Saldr� para all� y acabar� con ella.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05"); //Puedes unirte a m� o tendr� que eliminarte. T� decides.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06"); //Mmm. Parece que no tengo elecci�n.
	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07"); //Correcto.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08"); //Bueno, de acuerdo. Me unir� a ti, pero con una condici�n.

	B_GirionStayOnShip();

	AI_Output			(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10"); //Tendr� que aceptarla.
	AI_Output			(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11"); //Entonces haz lo que tengas que hacer. Te esperar� aqu�.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	crewmember_Count = (Crewmember_Count +1);
	Girion_IsOnBoard = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Verrat 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_Verrat   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Verrat_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

FUNC INT DIA_Girion_Verrat_Condition()
{
	if (Girion_WantstoKillSC == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Girion_Verrat_Info()
{
	AI_Output			(self, other, "DIA_Girion_Verrat_08_00"); //�Traidor!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


///////////////////////////////////////////////////////////////////////
//	Info OnShip 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_OnShip   (C_INFO)
{
	npc         = PAL_207_Girion;
	nr          = 2;
	condition   = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

FUNC INT DIA_Girion_OnShip_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Girion_IsOnBoard == LOG_SUCCESS)
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Girion_PICKPOCKET (C_INFO)
{
	npc			= PAL_207_Girion;
	nr			= 900;
	condition	= DIA_Girion_PICKPOCKET_Condition;
	information	= DIA_Girion_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Girion_PICKPOCKET_Condition()
{
	C_Beklauen (73, 280);
};
 
FUNC VOID DIA_Girion_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Girion_PICKPOCKET);
	Info_AddChoice		(DIA_Girion_PICKPOCKET, DIALOG_BACK 		,DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Girion_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Girion_PICKPOCKET);
};
	
func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Girion_PICKPOCKET);
};




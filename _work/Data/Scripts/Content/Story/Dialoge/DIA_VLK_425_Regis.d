///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Oye, eres nuevo en la ciudad, ¿no?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Sí, ¿y tú?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //He venido del continente y ahora ando por aquí. Casi no me queda dinero y supongo que lo único que puedo hacer es unirme a la milicia.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Pero no quiero hacer eso. No me dejaré asesinar por unos orcos de parte del Rey.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"¿Qué puedes decirme de la milicia?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //¿Qué puedes decirme de la milicia?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //Uno de los paladines se ha hecho cargo de ella. Un tal lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Está intentando movilizar media cuidad en caso de que los orcos ataquen.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Pero necesitas ser ciudadano para poder ser admitido.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Por lo que yo sé, si no eres ciudadano, puedes entrenarte de todas formas, pero no serás admitido oficialmente.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"¿Qué más puedes decirme sobre Lord Andre?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //¿Qué más puedes decirme sobre lord Andre?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //También se ha hecho cargo del puesto de juez.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Si causas algún problema en esta ciudad, tendrás que responder ante él.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Una vez tuve una pelea con un ciudadano.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //Se fue llorando a ver a lord Andre y me delató.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Ese asuntillo me costó 50 monedas de oro.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //Tuve suerte de que pasó por la noche y no me vio nadie más.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //Cuanta más gente se queje de ti en la ciudad, mayor será tu sanción.
};

// ****************************************************
// 					Prügelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"¿Con quién te peleaste?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //¿Con quién te peleaste?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //Con un tipo llamado Valentino. Suele andar por la taberna, cerca del templo.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //No suelo ser una persona violenta, pero ESE tipo necesitaba que le partieran la cara urgentemente...
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"Me encontré con Valentino...";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //Me encontré con Valentino...
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //¿Y?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Le di una tremenda paliza...
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //(Se ríe) Se la merecía...
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Toma, encontré este anillo sobre él cuando nuestras pequeñas diferencias se habían arreglado.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //(Sonríe) Pásaselo a la próxima persona que le apalee...
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Ha ocurrido algo excitante?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //¿Ha ocurrido algo excitante?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //Podría decirse.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Han robado a Bosper el arquero. ¡Qué cosa tan insolente!
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //El tipo entró en la tienda a plena luz del día y se pilló un arco.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //Y Bosper salió tras él, gritando: ''¡detente ahí mismo, ladrón!''. Pero el chorizo fue demasiado rápido.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //Y luego alguien mucho más honesto recuperó el arco de Bosper y se lo devolvió.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //Qué raro. Uno piensa que esta época es puramente egoísta, pero este tío va y devuelve el arco.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //Bueno, todo está tranquilo. Supongo que cuando los orcos lleguen, seguro que los veremos...
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //Al final averiguaron que el mercenario es inocente y lo han soltado.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen debe estar hecho una furia.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //Toda la ciudad habla de ello. ¿Recuerdas a Lothar, el paladín?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Tal vez.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Bueno, pues está muerto. Asesinado en plena calle. Echan la culpa a los mercenarios, claro.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"Estoy intentando encontrar tripulación para un viaje por mar.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Estoy intentando encontrar tripulación para un viaje por mar.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //No puedo ayudarte con eso. Deberías echar un vistazo por el puerto, o quizá en la taberna.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //Si queda algún marino por aquí, seguro que lo encuentras allí.

};



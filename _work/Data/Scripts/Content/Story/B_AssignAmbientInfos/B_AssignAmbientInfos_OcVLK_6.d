// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_6_EXIT_Condition;
	information	= DIA_OCVLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_6_PEOPLE_Condition;
	information	= DIA_OCVLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Chi è il capo, qui?";
};                       

FUNC INT DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_PEOPLE_15_00"); //Chi è il capo, qui?
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //Garond ha il comando dell'intero forte, o di ciò che ne rimane.
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //Ma egli non si occupa personalmente di niente, tranne quando uno dei suoi uomini si trova nei guai.
	if (Npc_IsDead (Engor) == FALSE)
	{
		AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //Se ti serve dell'equipaggiamento, faresti meglio ad andare da Engor. Lo troverai nell'edificio di fronte a quello di Garond.
	};
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_6_LOCATION_Condition;
	information	= DIA_OCVLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Cosa mi dici della situazione nella Valle delle Miniere?";
};                       

FUNC INT DIA_OCVLK_6_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_LOCATION_15_00"); //Che mi dici della situazione nella Valle delle Miniere?
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_01"); //Sono preoccupato per la palizzata degli orchi. Non voglio nemmeno sapere cosa nascondano lì dietro.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_02"); //All'inizio erano in pochi. Poi hanno costruito quel muro e, una notte, hanno portato le macchine d'assedio.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_03"); //Siamo stati fortunati e siamo riusciti a respingere l'attacco.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_04"); //Dietro quelle mura c'è il mare. Se arriveranno altre navi cariche di orchi, saremo spacciati.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_6_STANDARD_Condition;
	information	= DIA_OCVLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Come va?";
};                       
func INT DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_STANDARD_15_00"); //Come va?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_01"); //Arruolati nell'esercito e farai una bella vita, così dicevano. E ora guarda cosa sta succedendo.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_02"); //Ora è punibile con la pena di morte anche solo avvicinarsi alle provviste di cibo. Sembra che Garond tema che qualcuno rubi il cibo e se la svigni. (risata amara)
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_03"); //Moriremo tutti di fame qui se non ci uccidono prima quei dannati draghi!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_04"); //Cacciatori di draghi. Non farmi ridere! Non risolveranno nulla.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_05"); //Dicono che i draghi siano stati tutti uccisi! Ora abbiamo una speranza!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_06"); //Questo maledetto metallo. Dovremmo gettare tutte le nostre scorte giù dai bastioni. Forse così gli orchi ci lasceranno in pace.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_07"); //Quelle casse che hanno ammassato a casaccio di fronte all'ingresso non serviranno a nulla contro gli orchi!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_6 (var c_NPC slf)
{
	DIA_OCVLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

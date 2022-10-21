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
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //Garond hat das Kommando �ber die gesamte Festung - oder was noch davon �brig ist.
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //Aber er k�mmert sich selber um so gut wie gar nichts - au�er es macht jemand von seinen Leuten Dummheiten.
	if (Npc_IsDead (Engor) == FALSE)
	{
		AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //Wenn du auf der Suche nach Ausr�stung bist, gehst du am besten zu Engor, du findest ihn im Haus gegen�ber von Garond.
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
	description = "Was kannst du mir �ber die Lage im Minental sagen?";
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
	AI_Output (other, self, "DIA_OCVLK_6_LOCATION_15_00"); //Was kannst du mir �ber die Lage im Minental sagen?
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_01"); //Ich mache mir Sorgen um den Schutzwall der Orks. Ich will nicht wissen, was die Orks noch alles hinter ihrem Wall haben.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_02"); //Zuerst waren's nur ein paar von ihnen. Sie haben denWall errichtet. Dann, eines Nachts, haben sie die Belagerungsmaschinen herausgeschafft.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_03"); //Wir hatten Gl�ck, dass wir den Angriff zur�ckschlagen konnten.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_04"); //Hinter dem Wall liegt das Meer. Wenn noch mehr Schiffe mit Orks ankommen, haben wir keine Chance mehr.
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
	description = "Wie steht's?";
};                       
func INT DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_STANDARD_15_00"); //Wie steht's?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_01"); //Melde dich zur Armee und du kannst ein gutes Leben f�hren. Und was ist?
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_02"); //Es ist unter Androhung der Todesstrafe verboten worden, sich in der N�he der Nahrungsvorr�te aufzuhalten. Garond hat scheinbar Angst, dass wir die Vorr�te pl�ndern und uns aus dem Staub machen. (lacht bitter)
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_03"); //Wenn uns die verdammten Drachen nicht kalt machen, verhungern wir hier!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_04"); //Drachenj�ger. Dass ich nicht lache! Die werden auch nichts �ndern.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_05"); //Es hei�t, die Drachen sind alle get�tet worden! Jetzt haben wir eine Chance!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_06"); //Dieses verfluchte Erz. Wir sollten den ganzen Erzvorrat von den Zinnen werfen. Vielleicht lassen uns die Orks dann in Ruhe.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_07"); //Diese l�cherlichen Kisten, die sie notd�rftig vor den Eingang gestapelt haben, werden die Orks auch nicht aufhalten!
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

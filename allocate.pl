#!/usr/bin/perl
use Data::Dumper;
use List::Util 'shuffle';

# Declare the variables
@teams[32];
@players[32];
my %allocation;

# Open the files
open TEAMS, "teams.txt" or die $!;
open PLAYERS, "players.txt" or die $!;

# Read in team names
# List of team names found on <http://www.picksnetwork.com/sports-handicapping/list-of-nfl-teams-text-or-pdf-format/>

my @teams = <TEAMS>;
chomp(@teams);

# Read in player names

my @players = <PLAYERS>;
chomp(@players);

# Print list of allocations
$i = 1;
while ( $i < 18 ){
	# Combine teams and players into allocation hash
	@allocation{shuffle(@players)}=shuffle(@teams);
	print "Week ".$i++."\n";
	print "Player Name,Team Name\n";
	foreach $key (sort keys %allocation) {
		print $key.",".$allocation{$key}."\n";
	}
	print "\n";
}

# Close the files
close TEAMS;
close PLAYERS;

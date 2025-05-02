package testimpl

import (
	"context"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/ec2"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestComposableComplete(t *testing.T, ctx types.TestContext) {
	awsClient := GetAWSEC2Client(t)

	t.Run("TestIsDeployed", func(t *testing.T) {
		subnetId := terraform.Output(t, ctx.TerratestTerraformOptions(), "subnet_id")
		out, err := awsClient.DescribeSubnets(context.TODO(), &ec2.DescribeSubnetsInput{
			SubnetIds: []string{subnetId},
		})

		if err != nil {
			t.Errorf("Failure during DescribeSubnets: %v", err)
		}

		assert.Len(t, out.Subnets, 1, "Expected subnet does not exists!")
	})

	t.Run("TestIsAvailable", func(t *testing.T) {
		subnetId := terraform.Output(t, ctx.TerratestTerraformOptions(), "subnet_id")
		out, err := awsClient.DescribeSubnets(context.TODO(), &ec2.DescribeSubnetsInput{
			SubnetIds: []string{subnetId},
		})

		if err != nil {
			t.Errorf("Failure during DescribeSubnets: %v", err)
		}

		assert.Equal(t, "available", string(out.Subnets[0].State), "subnet is not available!")
	})

	t.Run("TestCIDRBlock", func(t *testing.T) {
		subnetId := terraform.Output(t, ctx.TerratestTerraformOptions(), "subnet_id")
		subnetCidrBlock := terraform.Output(t, ctx.TerratestTerraformOptions(), "subnet_cidr_block")
		out, err := awsClient.DescribeSubnets(context.TODO(), &ec2.DescribeSubnetsInput{
			SubnetIds: []string{subnetId},
		})

		if err != nil {
			t.Errorf("Failure during DescribeSubnets: %v", err)
		}

		assert.Equal(t, subnetCidrBlock, *out.Subnets[0].CidrBlock, "Expected subnet CIDR Block does not match current subnet CIDR Block!")
	})

	t.Run("TestAvailabilityZone", func(t *testing.T) {
		subnetId := terraform.Output(t, ctx.TerratestTerraformOptions(), "subnet_id")
		subnetAvailabilityZone := terraform.Output(t, ctx.TerratestTerraformOptions(), "subnet_availibility_zone")
		out, err := awsClient.DescribeSubnets(context.TODO(), &ec2.DescribeSubnetsInput{
			SubnetIds: []string{subnetId},
		})

		if err != nil {
			t.Errorf("Failure during DescribeSubnets: %v", err)
		}

		assert.Equal(t, subnetAvailabilityZone, *out.Subnets[0].AvailabilityZone, "Expected subnet availability zone does not match current subnet availability zone!")
	})
}

func GetAWSEC2Client(t *testing.T) *ec2.Client {
	awsEc2Client := ec2.NewFromConfig(GetAWSConfig(t))
	return awsEc2Client
}

func GetAWSConfig(t *testing.T) (cfg aws.Config) {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	require.NoErrorf(t, err, "unable to load SDK config, %v", err)
	return cfg
}
